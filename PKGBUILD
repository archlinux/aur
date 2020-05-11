# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=suwidgets-git
pkgver=r84.afa1b80
pkgrel=1
pkgdesc="Sigutils-related widgets"
arch=(i686 x86_64)
license=('custom')
url="https://github.com/BatchDrake/SuWidgets"
depends=(qt5-base sigutils fftw)
makedepends=(git gcc)
provides=('suwidgets')
conflicts=('suwidgets')
source=("$pkgname::git+https://github.com/BatchDrake/SuWidgets.git")
sha1sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${pkgname}
  qmake SuWidgetsLib.pro
}

build() {
  cd ${pkgname}
  make
}

package() {
  cd ${pkgname}
  INSTALL_ROOT=${pkgdir} make install
}
