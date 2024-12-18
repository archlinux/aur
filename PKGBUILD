# Maintainer: Evgeniy Alekseev <arcanis at archlinux dot org>

pkgname=plibsys
pkgver=0.0.5
pkgrel=1
pkgdesc="Cross-platform system C library with some helpful routines"
arch=('x86_64')
url="https://github.com/saprykin/plibsys"
license=('LGPL-2.1-or-later')
depends=('glibc')
makedepends=('cmake')
source=("https://github.com/saprykin/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('ccc4dd0e54d69121542f4ddec319ec9fd2069866a93135acb87fe564c7bd067a218038dfaa4ddda4debcd897975c016165cbe3d41af6c2149d2b49fbe52f8fbb')

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
