# Maintainer: Iuri Rezende Souza
# Contributor: Anatol Pomozov
# Contributor: Zhuoyun Wei <wzyboy@wzyboy.org>

pkgname=libnghttp2_asio
pkgver=1.39.2
pkgrel=1
pkgdesc='Framing layer of HTTP/2 is implemented as a reusable C library. ASIO part'
arch=(x86_64)
url='https://nghttp2.org/'
license=(MIT)
depends=(glibc boost-libs "libnghttp2=$pkgver" openssl)
makedepends=(boost)
source=(https://github.com/nghttp2/nghttp2/releases/download/v$pkgver/nghttp2-$pkgver.tar.xz)
sha512sums=('d8c971543e3e87736dfafebca55e9ecd0644e304c9731edaccba34170205824476595861a439077289b438ad489dd6008dedf2c6b2c111920300329be1b1bf34')

build() {
  cd nghttp2-$pkgver

  autoreconf -i
  ./configure \
    --prefix=/usr \
    --disable-examples \
    --disable-python-bindings \
    --enable-lib-only \
    --enable-asio-lib
  make
}

check() {
  cd nghttp2-$pkgver
  make check
}

package() {
  cd nghttp2-$pkgver/src

  make DESTDIR="$pkgdir" install
  install -Dm644 ../COPYING "$pkgdir/usr/share/licenses/libnghttp2_asio/COPYING"
}

