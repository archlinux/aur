# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=sigdigger-git
pkgver=r18.286b1d2
pkgrel=1
pkgdesc="Qt-based digital signal analyzer, using Suscan core and Sigutils DSP library"
arch=(any)
license=('custom')
url="https://github.com/BatchDrake/SigDigger"
depends=('qt5-base' 'sigutils' 'suscan' 'suwidgets')
makedepends=('git' 'gcc')
provides=('sigdigger')
conflicts=('sigdigger')
source=("$pkgname::git+https://github.com/BatchDrake/SigDigger.git")
sha1sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${pkgname}
  qmake SigDigger.pro
}

build() {
  cd ${pkgname}
  make
}

package() {
  cd ${pkgname}
  install -Dm755 SigDigger ${pkgdir}/usr/bin/sigdigger
}
