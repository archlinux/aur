# Maintainer: Gabriel M. Dutra <me@sizeofnull.xyz>
# Contributor: David Rodriguez <dissonant.tech@gmail.com>
# Contributor: Peter Smit <peter@smitmail.eu> 

pkgname=argo-bin
pkgver=3.7.3
pkgrel=1
pkgdesc="Argo Workflows: Get stuff done with Kubernetes"
arch=('x86_64' 'aarch64')
url="https://github.com/argoproj/argo-workflows"
license=('Apache')
source_x86_64=("argo_${pkgver}_x86_64.gz::https://github.com/argoproj/argo-workflows/releases/download/v$pkgver/argo-linux-amd64.gz")
source_aarch64=("argo_${pkgver}_aarch64.gz::https://github.com/argoproj/argo-workflows/releases/download/v$pkgver/argo-linux-arm64.gz")
sha256sums_x86_64=('68334b291b3eb6c0db57f71fc3ab3c75a307d9eb253189cd7c1fc3b6a5d24b13')
sha256sums_aarch64=('a3bd4b6b604dd7cafc779ac970b134b3a7b5efd81509fb02826088fe1394a689')


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

