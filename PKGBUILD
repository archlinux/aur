# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=kubernetes-helm
pkgver=2.9.1
pkgrel=4
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
sha512sums_i686=('d13c7ebe1048635bf255e87dc48ed3104dd4328a687451a045d68b170972c75ad59533687701be8b79c736a8f46b3e8f068a77d4a82147a17047b34a18d4d9df'
                 'e4a888d9e892e7a53e07159b8d6e9bfc3757b12355f7d9b2a6fc3d0890946b774a3f83d87142460440caa0d84bf1569d08a7d3a6a3b900bdb01df902367de9a3')
sha512sums_x86_64=('f9c2e3f0c1055a1645e3a811b67e3929f9f54bae0e5005b83efd9fdeef5d3d6b4692fbd32793f599ac141cce5bc7b299617c04cbe1be51141eff26a825156c6c'
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
