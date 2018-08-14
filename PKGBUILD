# Maintainer: Bernardas Ališauskas <bernardas.alisauskas@protonmail.com>
# Previous Contributors: Michael Adler <therisen06 plus aur at gmail a-dot com>
# Previous Contributors: kainlite <kainlite@gmail.com>

pkgname=libcouchbase
pkgver=2.9.3
pkgrel=1
pkgdesc="The C library provides fast access to documents in the latest Couchbase Server"
arch=('i686' 'x86_64')
url="https://github.com/couchbase/libcouchbase"
license=('Apache')
options=('!emptydirs' '!strip')
depends=('libevent')
makedepends=('cmake')
install=$pkgname.install
source=(
    "https://github.com/couchbase/libcouchbase/releases/download/${pkgver}/libcouchbase-${pkgver}.tar.gz"
)
sha256sums=('cd3bba99d5e4935240e502535c3275e0756b480c6bc6746a46fb745d5e7066e4')

build() {
  tar -xzf "libcouchbase-${pkgver}.tar.gz" -C "${srcdir}/libcouchbase-${pkgver}"
  cd "${srcdir}/libcouchbase-${pkgver}"

  # For debugging:
  # cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX=/usr CMakeLists.txt
  cmake -DCMAKE_INSTALL_PREFIX=/usr CMakeLists.txt
  make || return 1
}

package() {
  cd "${srcdir}/libcouchbase-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 ${srcdir}/libcouchbase-${pkgver}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
