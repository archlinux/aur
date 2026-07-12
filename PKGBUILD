# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
pkgname=nmail
pkgver=5.14.12
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
sha512sums=('a80630a226658a68ef7fe6d6d8f2f9773f33e7933eb3b4d34b24f051cc195c2bcc0cc8fbb12f1ef1595a8e7edc38d5fac0e725e28c928c96fcac5432f018abbe')

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
