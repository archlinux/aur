# Maintainer: Daniel Schopf <schopf.dan at gmail dot com>
pkgname=openkim-models
pkgver=2019_07_25
pkgrel=1
pkgdesc="This package contains the models from OpenKIM.org"
arch=("i686" "x86_64")
url="https://openkim.org"
license=('CDDL')
depends=(kim-api)
makedepends=(cmake gcc-fortran)
replaces=(kim-api-models)
source=(https://s3.openkim.org/archives/collection/${pkgname}-${pkgver//_/-}.txz)
sha512sums=('2117ead850a6de009f23e50d46254d529d645786447a5262b9743b89996071388c0021f1e8e72982122552b0becb1369034613f2500dbece41e212088ad4c55d')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake "../${pkgname}-${pkgver//_/-}" \
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
