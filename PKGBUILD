# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>

pkgname=nghttp2
pkgver=0.7.13
_pkgver=v0.7.13
pkgrel=1
pkgdesc="HTTP/2 C Library"
arch=('i686' 'x86_64')
url="https://nghttp2.org/"
license=('MIT')
depends=('openssl' 'libev' 'zlib' 'spdylay' 'libxml2' 'jansson' 'jemalloc')
source=("https://github.com/tatsuhiro-t/nghttp2/releases/download/${_pkgver}/nghttp2-${pkgver}.tar.gz"
        "nghttpx.service"
        "nghttpx.logrotate")
backup=('etc/nghttpx/nghttpx.conf'
        'etc/logrotate.d/nghttpx')
sha256sums=('5f940d82da60a4fefda5f8c2bdd35f445d34612a126ea02fd511fdc29b54bde4'
            'a8321410f7d97eb69583b3f7f847a223d9fa83eef3bdbc7ac059c1114ac687d9'
            '5480cc3899bcc31d9adb925346018bef4488e3d2cf393dc370df72c608f5586f')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir"/nghttpx.service "$pkgdir/usr/lib/systemd/system/nghttpx.service"
  install -Dm644 "$srcdir"/nghttpx.logrotate "$pkgdir/etc/logrotate.d/nghttpx"
  install -Dm644 nghttpx.conf.sample "$pkgdir/etc/nghttpx/nghttpx.conf"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/nghttp2/COPYING"
}
