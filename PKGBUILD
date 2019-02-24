# $Id$
# Maintainer: Radioactiveman <thomas-lange2@gmx.de>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

# To enable Qt support, uncomment the additional dependencies and "--enable-qt".
# Do the same with audacious-plugins-git. Then run Audacious by "audacious --qt".

pkgname=audacious-git
pkgver=2019.02.24
pkgrel=1
pkgdesc="Lightweight, advanced audio player focused on audio quality"
arch=('i686' 'x86_64')
url="https://audacious-media-player.org/"
license=('BSD')
depends=('gtk2' 'libsm' 'gnome-icon-theme' 'desktop-file-utils') # 'qt5-base')
makedepends=('python2' 'git') # for gdbus-codegen
optdepends=('unzip: zipped skins support')
provides=('audacious')
conflicts=('audacious')
install=$pkgname.install
source=('git://github.com/audacious-media-player/audacious.git')
sha256sums=('SKIP')

pkgver() {
  date +%Y.%m.%d
}

build() {
  cd "$srcdir/audacious"

  autoreconf -I m4
  ./configure \
    --prefix=/usr \
    --with-buildstamp="$(date +%x)" \
  # --enable-qt \

  make
}

package() {
  cd "$srcdir/audacious"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/audacious/LICENSE"
}
