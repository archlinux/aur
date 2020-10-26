# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=filmulator
_pkgname="$pkgname-gui"
pkgver=0.9.0
pkgrel=1
arch=('i686' 'pentium4' 'x86_64')
pkgdesc="Simple raw photo editor based on the process of developing film"
url="https://filmulator.org/"
_url="https://github.com/CarVac/filmulator-gui"
license=('GPL3')
depends=('exiv2' 'lensfun-git' 'libarchive' 'libraw' 'librtprocess' 'qt5-declarative')
makedepends=('cmake' 'openmp')
source=("$_pkgname-$pkgver.tar.gz::$_url/archive/v$pkgver.tar.gz")
sha512sums=('1148d613f558ae6a43f5478ebd7a035401462544607955a55a6d0472d56ea70eb36019d4de56a2f405cc88fdc6e146c243f8bde7b50c98e0c255e8ea03e085d1')

prepare() {
  if [ -d build ]
  then
    rm -rf build
  fi

  mkdir build
}

build() {
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        ../$_pkgname-$pkgver/$_pkgname
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
