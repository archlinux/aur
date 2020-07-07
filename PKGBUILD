# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=howl
pkgver=0.6
pkgrel=2
pkgdesc='General purpose and light-weight editor'
arch=(x86_64)
url='https://howl.io/'
license=(MIT)
makedepends=(setconf)
depends=(gtk3)
source=("https://github.com/howl-editor/howl/releases/download/$pkgver/howl-$pkgver.tgz")
sha256sums=('834b06e423d360c97197e7abec99b623fdc5ed3a0c39b88d6467e499074585e1')

prepare() {
  setconf howl-$pkgver/src/Makefile "CFLAGS = -Wall -O2 -g "'$(LUAJIT_CFLAGS) $(GTK_CFLAGS) -DHOWL_PREFIX=$(PREFIX) '"$CFLAGS"
}

build() {
  make -C howl-$pkgver/src
}

package() {
  make -C howl-$pkgver/src PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 howl-$pkgver/LICENSE.md \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}

# getver: howl.io
# vim: ts=2 sw=2 et:
