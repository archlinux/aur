# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
pkgname=nmail
pkgver=4.23
pkgrel=1
pkgdesc="Terminal-based email client"
arch=(x86_64)
url="https://github.com/d99kris/${pkgname}"
license=(MIT)
depends=(
  'cyrus-sasl'
  'libetpan.so'
  'libmagic.so'
  'libncursesw.so'
  'libsqlite3.so'
  'libxapian.so'
  'openssl'
  'python')
makedepends=(cmake)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('a58310f769c4de5a893f44829d2f6f7509c368fc6458e112548687b74e7f07921472a4dcb4d05a7bd78e42ae9268480e2099cd18e1412e36321ce91093f9c793')

build() {
  cmake \
    -S ${pkgname}-${pkgver} \
    -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 ${pkgname}-${pkgver}/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
