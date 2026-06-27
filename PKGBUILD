# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
pkgname=nmail
pkgver=5.13.7
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
sha512sums=('1e2ae1604cc4c3ee94d4058c5f23c2e4a3b5dd186bec05440e620a27e4f55b596a8975cb4872aa69687c1bcfc99397c98ae76e0af1f1dbc74259c0c004aadbed')

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
