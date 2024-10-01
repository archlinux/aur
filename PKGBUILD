# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
pkgname=nmail
pkgver=5.1.16
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
sha512sums=('cb64661091a5c7a12c2e08531f69df75705c4b34a667316dbde2bab85814f756f00df808785b97e7637aa490f5e08b736e4246c17a688c2a60e587f3633a7957')

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
