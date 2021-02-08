# Maintainer: Daniel Schopf <schopf.dan at gmail dot com>
pkgname=openkim-models
pkgver=2021.01.28
pkgrel=1
pkgdesc="This package contains the models from OpenKIM.org"
arch=("i686" "x86_64")
url="https://openkim.org"
license=('CDDL')
depends=(kim-api)
makedepends=(cmake gcc-fortran)
replaces=(kim-api-models)
source=(https://s3.openkim.org/archives/collection/${pkgname}-${pkgver//./-}.txz)
sha512sums=('524f10fa53a88db289f48bb59c84a545d0f6d14940b8a254d2531d499a33b6a5efa86ce565d9979af9fbae2387ac75b106a931427cb786f3631df7c39f3d0fdd')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake "../${pkgname}-${pkgver//./-}" \
  	-DCMAKE_BUILD_TYPE=Release \
	-DCMAKE_INSTALL_PREFIX="/usr" \
	-DCMAKE_INSTALL_LIBDIR="lib" \
	-DCMAKE_INSTALL_LIBEXECDIR="/usr/lib"
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
