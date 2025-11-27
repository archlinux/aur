# Maintainer: Ashish Singh <ashish.singh1@live.in>
pkgname=salome-bootstrap
pkgver=9.15.0
pkgrel=1
pkgdesc="Required for SALOME KERNEL"
url="https://www.salome-platform.org"
license=('LGPL2+')
depends=('salome-configuration' 'cppunit' 'python' 'swig')
makedepends=('cmake')
arch=('any')
source=("git+https://github.com/SalomePlatform/salome_bootstrap.git#tag=V${pkgver//\./_}")
md5sums=('SKIP')

build () {
  cd "$srcdir/salome_bootstrap"
  [[ -d build ]] && rm -r build
  mkdir build && cd build
  cmake -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -DCMAKE_BUILD_TYPE=Release -DCONFIGURATION_ROOT_DIR=/usr/share/salome/configuration -Wno-dev -DCMAKE_INSTALL_PREFIX=/opt/salome ../
  make
}

package() {
  cd "$srcdir/salome_bootstrap/build"
  make prefix=/opt/salome DESTDIR="$pkgdir" install
}
