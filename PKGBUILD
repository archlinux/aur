# Maintainer: Daniel Schopf <schopf.dan at gmail dot com>
pkgname=kim-api
pkgver=2.0.0_beta.3
pkgrel=1
pkgdesc="Online framework for reliable, reproducible and portable molecular simulations"
arch=("i686" "x86_64")
url="https://openkim.org"
license=('CDDL')
depends=(bash)
makedepends=(gcc-libs)
install=$pkgname.install
source=("https://s3.openkim.org/kim-api/kim-api-v2-2.0.0-beta.3.txz")
md5sums=('67c103a00e84865848d004837262c76e')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kim-api-v2-2.0.0-beta.3 \
  	-DCMAKE_BUILD_TYPE=Release \
	-DCMAKE_INSTALL_PREFIX="/usr" \
	-DCMAKE_INSTALL_LIBDIR="lib" \
	-DCMAKE_INSTALL_LIBEXECDIR="/usr/lib" \
	-DKIM_API_BUILD_EXAMPLES=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install

  # remove empty directories
  cd "$pkgdir"
  rm -rf usr/share
}
