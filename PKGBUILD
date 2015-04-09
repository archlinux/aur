# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>

pkgname=nghttp2
pkgver=0.7.10
_pkgver=v0.7.10
pkgrel=1
pkgdesc="HTTP/2 C Library"
arch=('i686' 'x86_64')
url="https://nghttp2.org/"
license=('MIT')
depends=('openssl' 'libev' 'zlib' 'spdylay' 'libxml2' 'jansson' 'jemalloc')
source=("https://github.com/tatsuhiro-t/nghttp2/releases/download/${_pkgver}/nghttp2-${pkgver}.tar.gz")
backup=('etc/nghttpx/nghttpx.conf')
sha256sums=('56c93755fcb181cff7bce14c4cb79de3ef3b890c57c50a2290d481a567f0dd4d')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
  install -Dm644 nghttpx.conf.sample "$pkgdir/etc/nghttpx/nghttpx.conf"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/nghttp2/COPYING"
}
