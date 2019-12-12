# Contributor: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=labplot-git
pkgver=2.7.0.r43.g3d5066e07
pkgrel=1
arch=('x86_64')
pkgdesc="KDE Application for interactive graphing and analysis of scientific data, build from git"
url="https://labplot.kde.org/"
license=('GPL2')
depends=('netcdf' 'cfitsio' 'fftw' 'gsl' 'qt5-serialport' 'libcerf')
makedepends=('extra-cmake-modules' 'kdelibs4support' 'kdesignerplugin' 'kdoctools' 'git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=(git://anongit.kde.org/labplot.git)
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --always | sed 's+-+.r+' | tr - .
}

build() {
  [ -d build ] || mkdir build
  cd build
  cmake ../${pkgname%-git} \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DENABLE-CANTOR=OFF
  make
}

package(){
  cd build
  make DESTDIR="$pkgdir" install
}
