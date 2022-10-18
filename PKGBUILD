# Maintainer: Arturo Penen <apenen@gmail.com>

pkgname=kops
pkgver=1.24.4
pkgrel=1
pkgdesc='Kubernetes Operations - Production Grade K8s Installation, Upgrades, and Management (build from src)'
arch=('x86_64')
url='https://github.com/kubernetes/kops'
license=('Apache')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kubernetes/kops/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('03609be75152fc352970e38d1530928a4ec05292ae178ff56f3a1a7965aede2b')
makedepends=('go')

build() {
  cd $pkgname-$pkgver
  export VERSION=$pkgver
  make kops
}

package() {
  install -Dm 755 "${srcdir}/$pkgname-$pkgver/.build/dist/linux/amd64/kops" "${pkgdir}/usr/bin/kops"

  # Populate bash and zsh completions
  install -dm 755 "${pkgdir}/usr/share/bash-completion/completions"
  install -dm 755 "${pkgdir}/usr/share/zsh/site-functions"
  "${pkgdir}/usr/bin/kops" completion bash > "${pkgdir}/usr/share/bash-completion/completions/kops"
  "${pkgdir}/usr/bin/kops" completion zsh >  "${pkgdir}/usr/share/zsh/site-functions/_kops"
}
