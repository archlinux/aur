# $Id$
# Maintainer: Thomas Lange <thomas-lange2@gmx.de>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

_pkgname=audacious
pkgname=$_pkgname-gtk3
pkgver=3.8.2
_pkgver=$pkgver-gtk3
pkgrel=2
pkgdesc="Lightweight, advanced audio player focused on audio quality"
arch=('i686' 'x86_64')
url="http://audacious-media-player.org/"
license=('BSD')
depends=('gtk3' 'glib2' 'libsm' 'adwaita-icon-theme' 'desktop-file-utils')
makedepends=('python') # for gdbus-codegen
optdepends=('unzip: zipped skins support')
provides=('audacious')
conflicts=('audacious')
install=$_pkgname.install
source=(http://distfiles.audacious-media-player.org/$_pkgname-$_pkgver.tar.bz2)
sha1sums=('ad6432b53f0359c2e6f1150a64b353b88b291a0c')

build() {
  cd "$srcdir/$_pkgname-$_pkgver"
  ./configure \
    --prefix=/usr \
    --with-buildstamp='Arch Linux'
  make
}

package() {
  cd "$srcdir/$_pkgname-$_pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
