# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
pkgname=nmail
pkgver=5.7.3
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
sha512sums=('89f0c209e8c4263685495466f2b515b61eb5dc5ea42a66fea66451d3832506d068be8961debf5adb166b50abcbb3316a061345ca8c95be49851f193213ea4c8c')

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
