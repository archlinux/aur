# Maintainer: Zion Nimchuk <zionnimchuk@gmail.com>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Maxime Vincent <maxime.vince@gmail.com>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=wolfssl
pkgver=4.7.0
pkgrel=1
pkgdesc='small, fast, portable implementation of TLS/SSL for embedded devices to the cloud (formerly CyaSSL)'
arch=(i686 x86_64)
license=(GPL)
depends=('sh')
makedepends=('cmake')
url='https://www.wolfssl.com/'
source=(${pkgname}-${pkgver}-stable.tar.gz::https://github.com/wolfSSL/wolfssl/archive/v$pkgver-stable.tar.gz
        https://github.com/wolfSSL/wolfssl/releases/download/v${pkgver}-stable/${pkgname}-${pkgver}-stable.tar.gz.asc)
sha256sums=('b0e740b31d4d877d540ad50cc539a8873fc41af02bd3091c4357b403f7106e31'
            'SKIP')
validpgpkeys=('A2A48E7BCB96C5BECB987314EBC80E415CA29677')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver-stable \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON \
    -DWOLFSSL_EXAMPLES=OFF \
    -DWOLFSSL_FAST_MATH=OFF \
    -DWOLFSSL_CRYPT_TESTS=OFF
  make
}

package() {
  make -C build install DESTDIR="$pkgdir"
  install -Dm644 $pkgname-$pkgver-stable/COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
