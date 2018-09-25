# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=kubernetes-helm
pkgver=2.11.0
pkgrel=1
pkgdesc="A tool to manage Kubernetes charts"
arch=('i686' 'x86_64')
url="https://github.com/kubernetes/helm"
depends=('socat')
optdepends=('kubectl-bin: Check Kubernetes status')
license=('Apache')
source_i686=(
    "https://kubernetes-helm.storage.googleapis.com/helm-v$pkgver-linux-386.tar.gz"
)
source_x86_64=(
  "https://kubernetes-helm.storage.googleapis.com/helm-v$pkgver-linux-amd64.tar.gz"
)
sha512sums_i686=('d245b59c6f8c6a92894f91d01e52a2a22c77eea9ef5bc1729bcd6e34926c1a8ccf0ad2232a6a35c8d4f6f127e0ad7266f98d7d2daf8d37f38c9975f978439d7b')
sha512sums_x86_64=('0f3106d9600ffa80dede77616cf94223005ade1026abbedd9affe8544511d49a2a56385f6dfa0dfd0c020d1d682c4959ac81fd2877759f248a2fda4c48527984')

package() {
  cd "$srcdir"
  install -Dm 755 linux-*/helm "$pkgdir/usr/bin/helm"
  install -dm 755 "$pkgdir/usr/share/bash-completion/completions"
  "$pkgdir/usr/bin/helm" completion bash > "$pkgdir/usr/share/bash-completion/completions/helm"
  install -dm 755 "$pkgdir/usr/share/zsh/site-functions"
  "$pkgdir/usr/bin/helm" completion zsh > "$pkgdir/usr/share/zsh/site-functions/_helm"
}
