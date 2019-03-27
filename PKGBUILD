# Maintainer:
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Tobias Kieslich <tobias@archlinux.org>

pkgname=gmpc
pkgver=11.8.16
pkgrel=6
pkgdesc='MPD client'
arch=(x86_64)
url='https://gmpclient.org/home'
license=(GPL)
depends=(gtk2 libmpd libsoup sqlite xdg-utils)
makedepends=(gob2 intltool vala)
source=("http://download.sarine.nl/Programs/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.gz")
sha256sums=('a69414f35396846733632ca9619921d7acda537ffd6d49bd84b444945cb76b2c')

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
