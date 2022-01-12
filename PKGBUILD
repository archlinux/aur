# Maintainer: David Rodriguez <dissonant.tech@gmail.com>
# Maintainer: Peter Smit <peter@smitmail.eu> 

pkgname=argo-bin
pkgver=3.2.6
pkgrel=4
pkgdesc="Argo Workflows: Get stuff done with Kubernetes"
arch=('x86_64' 'aarch64')
url="https://github.com/argoproj/argo-workflows"
license=('Apache')
source_x86_64=("argo_${pkgver}_x86_64.gz::https://github.com/argoproj/argo-workflows/releases/download/v$pkgver/argo-linux-amd64.gz")
source_aarch64=("argo_${pkgver}_aarch64.gz::https://github.com/argoproj/argo-workflows/releases/download/v$pkgver/argo-linux-arm64.gz")

build() {
  chmod +x "argo_${pkgver}_${arch}"
}

check() {
  ./"argo_${pkgver}_${arch}" version
}

package() {
  install -Dm755 "argo_${pkgver}_${arch}" "$pkgdir/usr/bin/argo"
  $pkgdir/usr/bin/argo completion zsh > argo.zsh
  $pkgdir/usr/bin/argo completion bash > argo.bash
  install -Dm644 argo.zsh "$pkgdir/usr/share/zsh/site-functions/_argo"
  install -Dm644 argo.bash "$pkgdir/usr/share/bash-completion/completions/argo"
}

sha256sums_x86_64=('d30ed9692fcf45b363039e3a9e7dbd6ba84a4a99bb72026ec0da27b9aebc611a')
sha256sums_aarch64=('c1818f3619a344b952e5fb37dc3e3e0f0a0cca7b83622489f83622ab3c58d2d7')
