# Maintainer: Evgeniy Alekseev <arcanis at archlinux dot org>

pkgname=plibsys
pkgver=0.0.4
pkgrel=1
pkgdesc="Cross-platform system C library with some helpful routines"
arch=('x86_64')
url="https://github.com/saprykin/plibsys"
license=('LGPL2.1')
depends=('glibc')
makedepends=('cmake')
source=("https://github.com/saprykin/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('61957666fb454469e1ff68435463eaf426e960caed33540dbb495e1aa7c446c9803d100f33f1a6ea70d5f2ee2d0d19ec315f3a8c651747f65a186ad061c05e51')

prepare() {
  rm -rf "build"
  mkdir "build"
}

build() {
  cd "build"
  cmake "../${pkgname}-${pkgver}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPLIBSYS_BUILD_STATIC=OFF \
    -DPLIBSYS_TESTS=OFF
  make
}

package() {
  cd "build"
  make DESTDIR="${pkgdir}" install
}
