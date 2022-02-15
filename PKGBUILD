# Maintainer: Sebastian <asamk@gmx.de>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Tobias Kieslich <tobias@archlinux.org>

pkgname=gmpc
pkgver=11.8.16
pkgrel=6
pkgdesc='MPD client'
arch=(x86_64)
url='https://github.com/DaveDavenport/gmpc'
license=(GPL)
depends=(gtk2 libmpd libsoup sqlite xdg-utils)
makedepends=(gob2 intltool vala)
source=("https://github.com/DaveDavenport/gmpc/archive/refs/tags/release-$pkgver.tar.gz")
sha256sums=('7c7e0782475be86bce48ece54e24f6762dd8c8e797fae5a38c013e4d56de64c0')

prepare() {
  sed -i 's/GNOME;AudioVideo;/GTK;AudioVideo;Player;/' \
    "$pkgname-$pkgver/data/gmpc.desktop.in"
}

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr --disable-unique
  make CFLAGS+='-lm'
}

package() {
  make -C "$pkgname-$pkgver" DESTDIR="$pkgdir" install
}

# vim: ts=2 sw=2 et:
