# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>

pkgname=nghttp2
pkgver=0.7.12
_pkgver=v0.7.12
pkgrel=2
pkgdesc="HTTP/2 C Library"
arch=('i686' 'x86_64')
url="https://nghttp2.org/"
license=('MIT')
depends=('openssl' 'libev' 'zlib' 'spdylay' 'libxml2' 'jansson' 'jemalloc')
source=("https://github.com/tatsuhiro-t/nghttp2/releases/download/${_pkgver}/nghttp2-${pkgver}.tar.gz"
        "nghttpx.service")
backup=('etc/nghttpx/nghttpx.conf')
sha256sums=('b92e22176d80c4c9f88e90c20fa5100537f80b5e5d1201a1d3888c05e0aed2b3'
            'a8321410f7d97eb69583b3f7f847a223d9fa83eef3bdbc7ac059c1114ac687d9')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir"/nghttpx.service "$pkgdir/usr/lib/systemd/system/nghttpx.service"
  install -Dm644 nghttpx.conf.sample "$pkgdir/etc/nghttpx/nghttpx.conf"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/nghttp2/COPYING"
}
