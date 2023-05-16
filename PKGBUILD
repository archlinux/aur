# Maintainer: Antonio Vázquez Blanco <antoniovazquezblanco@gmail.com>
# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=suwidgets-git
pkgver=r282.42c7842
pkgrel=1
pkgdesc="Sigutils-related widgets"
arch=(i686 x86_64)
license=('custom')
url="https://github.com/BatchDrake/SuWidgets"
depends=(qt6-base sigutils fftw)
makedepends=(git gcc)
provides=('suwidgets')
conflicts=('suwidgets')
source=("$pkgname::git+https://github.com/BatchDrake/SuWidgets.git#branch=develop")
sha1sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${pkgname}
  qmake6 SuWidgetsLib.pro
}

build() {
  cd ${pkgname}
  make
}

package() {
  cd ${pkgname}
  INSTALL_ROOT=${pkgdir} make install
}
