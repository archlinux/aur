# Maintainer: Philipp A. <flying-sheep@web.de>
# Contributor: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: NeoRaider <neoraider@universe-factory.net>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=libxcb-git
pkgver=1.12.r7.gf830eb9
pkgrel=1
pkgdesc='X11 client-side library - git version'
arch=(i686 x86_64)
url='http://xcb.freedesktop.org'
depends=(xcb-proto-git libxdmcp libxau)
makedepends=(git python xorg-util-macros libxslt libpthread-stubs)
conflicts=(libxcb)
provides=("libxcb=$pkgver")
license=(custom)
source=('git+http://anongit.freedesktop.org/git/xcb/libxcb.git')
sha256sums=(SKIP)

pkgver() {
  cd "$srcdir/${pkgname%-*}"
  git describe --tags | sed 's/-/.r/;s/-/./g'
}

build() {
  cd "$srcdir/${pkgname%-*}"

  ./autogen.sh \
    --prefix=/usr \
    --enable-xinput \
    --enable-xkb \
    --disable-static

  make
}

package() {
  cd "$srcdir/${pkgname%-*}"

  make DESTDIR="$pkgdir" install

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
