# Maintainer: Mantas Mikulėnas <grawity@gmail.com>

pkgname=libverto
pkgver=0.3.0
pkgrel=1
pkgdesc="Main event loop abstraction library"
arch=(i686 x86_64)
url="https://github.com/latchset/libverto"
license=(MIT)
makedepends=(
# Supported event loops
  'glib2'
  'libev'
  'libevent'
  'tevent'
)
source=("https://github.com/latchset/libverto/releases/download/$pkgver/libverto-$pkgver.tar.gz")
sha256sums=('955d3ff4192830c74ce88185f39621c9e490d5a3e7aba04d1e5346d4886f862e')

prepare() {
  cd "$srcdir/libverto-$pkgver"
  autoreconf -i -f
}

build() {
  cd "$srcdir/libverto-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/libverto-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm0644 "COPYING" "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2:sw=2:et
