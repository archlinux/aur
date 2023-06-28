# Contributor: David Rodriguez <dissonant.tech@gmail.com>
# Contributor: Peter Smit <peter@smitmail.eu> 

pkgname=argo-bin
pkgver=3.4.8
pkgrel=1
pkgdesc="Argo Workflows: Get stuff done with Kubernetes"
arch=('x86_64' 'aarch64')
url="https://github.com/argoproj/argo-workflows"
license=('Apache')
source_x86_64=("argo_${pkgver}_x86_64.gz::https://github.com/argoproj/argo-workflows/releases/download/v$pkgver/argo-linux-amd64.gz")
source_aarch64=("argo_${pkgver}_aarch64.gz::https://github.com/argoproj/argo-workflows/releases/download/v$pkgver/argo-linux-arm64.gz")
sha256sums_x86_64=('933dab06adbd485017432c60f80857d6338f6dbbab4521d5139272a48295fff4')
sha256sums_aarch64=('8cd2e65ea93359eb4175b04ecbb290d25e4de4a6e7ad2b6fed5cbc1f423e4721')


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

