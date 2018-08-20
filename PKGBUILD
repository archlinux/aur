# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=kubernetes-helm
pkgver=2.10.0
pkgrel=1
pkgdesc="A tool to manage Kubernetes charts"
arch=('i686' 'x86_64')
url="https://github.com/kubernetes/helm"
depends=('socat')
optdepends=('kubectl-bin: Check Kubernetes status')
license=('Apache')
source_i686=(
    "https://kubernetes-helm.storage.googleapis.com/helm-v$pkgver-linux-386.tar.gz"
    "add_compdef_zsh_completion.patch"
)
source_x86_64=(
  "https://kubernetes-helm.storage.googleapis.com/helm-v$pkgver-linux-amd64.tar.gz"
  "add_compdef_zsh_completion.patch"
)
sha512sums_i686=('30772e84fddfb85e1962c2a9abd6c2d9692ecc346693c8be034cdd727fc2a79cc987fe926b138133602785e8786e64b58c4c4fdb99280a41e7870edd5f7bb5fc'
                 'e4a888d9e892e7a53e07159b8d6e9bfc3757b12355f7d9b2a6fc3d0890946b774a3f83d87142460440caa0d84bf1569d08a7d3a6a3b900bdb01df902367de9a3')
sha512sums_x86_64=('00fd28cbfbc60796b0c232edc38655f792ccff36f3335b57ad504c90432227c88092bf8337f23ce0db83b92286fd5f133b1f7346070f17f54160dcefe470fb62'
                   'e4a888d9e892e7a53e07159b8d6e9bfc3757b12355f7d9b2a6fc3d0890946b774a3f83d87142460440caa0d84bf1569d08a7d3a6a3b900bdb01df902367de9a3')

package() {
  cd "$srcdir"
  install -Dm 755 linux-*/helm "$pkgdir/usr/bin/helm"
  install -dm 755 "$pkgdir/usr/share/bash-completion/completions"
  "$pkgdir/usr/bin/helm" completion bash > "$pkgdir/usr/share/bash-completion/completions/helm"
  install -dm 755 "$pkgdir/usr/share/zsh/site-functions"
  "$pkgdir/usr/bin/helm" completion zsh > "$pkgdir/usr/share/zsh/site-functions/_helm"
  patch "$pkgdir/usr/share/zsh/site-functions/_helm" "$srcdir/add_compdef_zsh_completion.patch"
}
