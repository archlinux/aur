# Maintainer: nic96
pkgname=terragear-git
_pkgname=terragear
pkgver=20150612
pkgrel=1
pkgdesc="TerraGear is a collection of open-source tools and rendering libraries which can transform publically available GIS data in 3D representations (i.e. 3D models or 3D maps) of the earth for use in real time rendering projects."
url="http://wiki.flightgear.org/TerraGear"
license=('GPL')
arch=('i686' 'x86_64')
depends=('cgal' 'simgear' 'gdal')
makedepends=('git' 'cmake' 'boost')
source=("git://git.code.sf.net/p/flightgear/terragear")
md5sums=('SKIP')

build() {
  cd "$srcdir/$_pkgname"
  sed -i "s/add_subdirectory(cgal_tests)/#add_subdirectory(cgal_tests)/g" $srcdir/$_pkgname/src/BuildTiles/CMakeLists.txt
  mkdir build
  cd build
  cmake ../ -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
  cd "$srcdir/$_pkgname"
  cd build
  make DESTDIR="$pkgdir" install
}
