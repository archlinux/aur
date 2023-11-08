# Contributor: David Rodriguez <dissonant.tech@gmail.com>
# Contributor: Peter Smit <peter@smitmail.eu> 

pkgname=argo-bin
pkgver=3.5.1
pkgrel=1
pkgdesc="Argo Workflows: Get stuff done with Kubernetes"
arch=('x86_64' 'aarch64')
url="https://github.com/argoproj/argo-workflows"
license=('Apache')
source_x86_64=("argo_${pkgver}_x86_64.gz::https://github.com/argoproj/argo-workflows/releases/download/v$pkgver/argo-linux-amd64.gz")
source_aarch64=("argo_${pkgver}_aarch64.gz::https://github.com/argoproj/argo-workflows/releases/download/v$pkgver/argo-linux-arm64.gz")
sha256sums_x86_64=('23108a150f9a88a183e3b80b49b5e81d9a4953f519a784224ba08714b36707db')
sha256sums_aarch64=('ffb062d9d274a6de4edbc28ca4022503a3ee036686415f7b0386e23a34fc9e8e')


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

