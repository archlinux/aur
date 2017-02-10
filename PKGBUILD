# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: Michel Brabants <michel.brabants@euphonynet.be>

pkgname=libzrtpcpp
pkgver=4.6.3
pkgrel=1
pkgdesc="A C++ implementation of Phil Zimmermann's ZRTP specification"
arch=('i686' 'x86_64')
url='https://github.com/wernerd/ZRTPCPP'
license=('GPL3')
depends=('ccrtp')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/wernerd/ZRTPCPP/archive/V$pkgver.tar.gz")
md5sums=('ccfaab35e2103033d9c414fee3d46a75')

prepare() {
  sed 's/lib64/lib/g' -i ZRTPCPP-${pkgver}/CMakeLists.txt
}

build() {
  mkdir -p build
  cd build
  cmake ../ZRTPCPP-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
