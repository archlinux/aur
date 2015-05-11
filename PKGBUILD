# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>

pkgname=nghttp2
pkgver=0.7.14
_pkgver=v0.7.14
pkgrel=1
pkgdesc="HTTP/2 C Library"
arch=('i686' 'x86_64')
url="https://nghttp2.org/"
license=('MIT')
depends=('openssl' 'libev' 'zlib' 'spdylay' 'libxml2' 'jansson' 'jemalloc')
source=("https://github.com/tatsuhiro-t/nghttp2/releases/download/${_pkgver}/nghttp2-${pkgver}.tar.gz")
backup=('etc/nghttpx/nghttpx.conf'
        'etc/logrotate.d/nghttpx')
sha256sums=('a268566097940823e76ee32c804b0513a0f5188bd0cd4f70219a43c1a9231099')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
  install -Dm644 contrib/nghttpx.service "$pkgdir/usr/lib/systemd/system/nghttpx.service"
  install -Dm644 contrib/nghttpx-logrotate "$pkgdir/etc/logrotate.d/nghttpx"
  install -Dm644 nghttpx.conf.sample "$pkgdir/etc/nghttpx/nghttpx.conf"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/nghttp2/COPYING"
}
