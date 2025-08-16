# Maintainer: Gabriel M. Dutra <me@sizeofnull.xyz>
# Contributor: David Rodriguez <dissonant.tech@gmail.com>
# Contributor: Peter Smit <peter@smitmail.eu> 

pkgname=argo-bin
pkgver=3.7.1
pkgrel=1
pkgdesc="Argo Workflows: Get stuff done with Kubernetes"
arch=('x86_64' 'aarch64')
url="https://github.com/argoproj/argo-workflows"
license=('Apache')
source_x86_64=("argo_${pkgver}_x86_64.gz::https://github.com/argoproj/argo-workflows/releases/download/v$pkgver/argo-linux-amd64.gz")
source_aarch64=("argo_${pkgver}_aarch64.gz::https://github.com/argoproj/argo-workflows/releases/download/v$pkgver/argo-linux-arm64.gz")
sha256sums_x86_64=('2eface01af42a4d405524fcdbe775de49d105fb4c177ed37b176d8a7f22cf8f2')
sha256sums_aarch64=('72b1db562bbba7251d7120ccb6305df99ce8c02c623eb853dd2c665d2af730cc')


build() {
  chmod +x "argo_${pkgver}_${CARCH}"
}

check() {
  ./"argo_${pkgver}_${CARCH}" version
}

package() {
  install -Dm755 "argo_${pkgver}_${CARCH}" "$pkgdir/usr/bin/argo"
  $pkgdir/usr/bin/argo completion zsh > argo.zsh
  $pkgdir/usr/bin/argo completion bash > argo.bash
  install -Dm644 argo.zsh "$pkgdir/usr/share/zsh/site-functions/_argo"
  install -Dm644 argo.bash "$pkgdir/usr/share/bash-completion/completions/argo"
}

