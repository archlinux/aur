# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: Michel Brabants <michel.brabants@euphonynet.be>

pkgname=libzrtpcpp
pkgver=4.7.0
pkgrel=2
pkgdesc="A C++ implementation of Phil Zimmermann's ZRTP specification"
arch=('i686' 'x86_64')
url='https://github.com/wernerd/ZRTPCPP'
license=('GPL3')
depends=('ccrtp')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/wernerd/ZRTPCPP/archive/$pkgver.tar.gz")
md5sums=('24bcaa5ee64083e9da76ee3cb68c90a3')

prepare() {
  sed 's/lib64/lib/g' -i ZRTPCPP-${pkgver}/CMakeLists.txt
  git -C "${srcdir}/ZRTPCPP-${pkgver}" apply -v "${srcdir}/.."/*patch || git apply -v -p2 ../*.patch
}

build() {
  mkdir -p build
  cd build
  cmake ../ZRTPCPP-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make ${MAKEFLAGS:--j1}
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
