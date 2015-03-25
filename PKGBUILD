# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>

pkgname=nghttp2
pkgver=0.7.8
_pkgver=v0.7.8
pkgrel=1
pkgdesc="HTTP/2 C Library"
arch=('i686' 'x86_64')
url="https://nghttp2.org/"
license=('MIT')
depends=('openssl' 'libev' 'zlib' 'spdylay' 'libxml2' 'jansson' 'jemalloc')
source=("https://github.com/tatsuhiro-t/nghttp2/releases/download/${_pkgver}/nghttp2-${pkgver}.tar.gz")
backup=('etc/nghttp2/nghttpx.conf')
sha256sums=('9a817bc6bdf3d78a0fe397a1cadbc519b28d83d88ecf5e67e3a20bd5e541cb5b')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
  install -Dm644 nghttpx.conf.sample "$pkgdir/etc/nghttp2/nghttpx.conf"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/nghttp2/COPYING"
}
