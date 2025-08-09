# Maintainer: Matt M <numbernine dot archlinux at complexnumber dot net>

pkgname=kops
pkgver=1.33.0
pkgrel=1
pkgdesc='Kubernetes Operations - Production Grade K8s Installation, Upgrades, and Management (build from src)'
arch=('x86_64')
url='https://github.com/kubernetes/kops'
license=('Apache-2.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kubernetes/kops/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('05e51f9479fb9867c6fd2eddb234e40ba402169052310f2447f00ca19998aed6')
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
