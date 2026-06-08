# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Sergej Pupykin <arch+pub@sergej.pp.ru>

pkgname=bctoolbox
pkgver=5.4.119
pkgrel=1
pkgdesc='A library written in C that allows you to create and run audio and video streams'
arch=(x86_64)
url='https://gitlab.linphone.org/'
license=(GPL-3.0-only)
depends=(gcc-libs libdecaf openssl)
makedepends=(cmake)
source=(https://gitlab.linphone.org/BC/public/bctoolbox/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('1b8f7998138768d92586010ca0370de8f77b0c3df4a8120ba67eb237c9cc9a30')

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
