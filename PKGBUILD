# Maintainer: David Rodriguez <dissonant.tech@gmail.com>
# Maintainer: Peter Smit <peter@smitmail.eu> 

pkgname=argo-bin
pkgver=3.3.8
pkgrel=1
pkgdesc="Argo Workflows: Get stuff done with Kubernetes"
arch=('x86_64' 'aarch64')
url="https://github.com/argoproj/argo-workflows"
license=('Apache')
source_x86_64=("argo_${pkgver}_x86_64.gz::https://github.com/argoproj/argo-workflows/releases/download/v$pkgver/argo-linux-amd64.gz")
source_aarch64=("argo_${pkgver}_aarch64.gz::https://github.com/argoproj/argo-workflows/releases/download/v$pkgver/argo-linux-arm64.gz")

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

sha256sums_x86_64=('5086ad4b46b85d1a8ec89406c2ecd5432ca7546178cd077103f61de304c9a096')
sha256sums_aarch64=('37f44bee7332f537875ff9c941447021095370a360436377de7da35dd3764b73')
