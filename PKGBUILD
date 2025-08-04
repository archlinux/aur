# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Sergej Pupykin <arch+pub@sergej.pp.ru>

pkgname=bctoolbox
pkgver=5.4.50
pkgrel=1
pkgdesc='A library written in C that allows you to create and run audio and video streams'
arch=(x86_64)
url='https://gitlab.linphone.org/'
license=(GPL-3.0-only)
depends=(gcc-libs libdecaf openssl)
makedepends=(cmake)
source=(https://gitlab.linphone.org/BC/public/bctoolbox/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2)
sha256sums=('41c6e53aea7ef4af9ae479008ec91727eb5b5138cd713038d4ae0ee8dd6f8696')

build() {
  cmake -B build -S "$pkgname-$pkgver" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_C_FLAGS="${CFLAGS} -Wno-error=unused-parameter" \
    -DENABLE_TESTS_COMPONENT=OFF \
    -DBUILD_SHARED_LIBS=ON \
    -DENABLE_OPENSSL=ON \
    -DENABLE_MBEDTLS=OFF \
    -DENABLE_DECAF=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
