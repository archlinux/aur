# Maintainer: Evgeniy Alekseev <arcanis at archlinux dot org>

pkgname=plibsys
pkgver=0.0.3
pkgrel=1
pkgdesc="Cross-platform system C library with some helpful routines"
arch=('i686' 'x86_64')
url="https://github.com/saprykin/plibsys"
license=('LGPL2')
makedepends=('cmake')
source=("https://github.com/saprykin/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('e2393fecb3e5feae81a4d60cd03e2ca17bc58453efaa5598beacdc5acedbc7c90374f9f851301fee08ace8dace843a2dff8c1c449cd457302363c98dd24e0415')

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

