# Maintainer: Mantas Mikulėnas <grawity@gmail.com>

pkgname=libverto
pkgver=0.2.6
pkgrel=1
pkgdesc="Main event loop abstraction library"
arch=(i686 x86_64)
url="https://fedorahosted.org/libverto/"
license=(MIT)
makedepends=(
# Supported event loops
  'glib2'
  'libev'
  'libevent'
  'tevent'
)
source=("https://fedorahosted.org/releases/l/i/libverto/libverto-$pkgver.tar.gz")
sha256sums=('17eca6a3855f4884e2e7095e91501767d834b3bf313a6f59a93303f54ac91c9e')

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
  sed -i '
    /^prefix=/aexec_prefix=${prefix}
    /^exec_prefix/d
  ' "$pkgdir/usr/lib/pkgconfig"/*.pc
  install -Dm0644 "COPYING" "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2:sw=2:et
