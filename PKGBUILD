# $Id$
# Maintainer: Thomas Lange <thomas-lange2@gmx.de>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

_pkgname=audacious
pkgname=$_pkgname-gtk3
pkgver=3.9
_pkgver=$pkgver-gtk3
pkgrel=1
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
source=("https://github.com/audacious-media-player/$_pkgname/archive/$_pkgname-$_pkgver.tar.gz")
sha256sums=('a9e4cfdf9e7bd46891445164622f5702802e352ae7b8fc7f8ea5d16a051515d4')

prepare() {
  cd "$srcdir/$_pkgname-$_pkgname-$_pkgver"
  autoreconf -I m4
}

build() {
  cd "$srcdir/$_pkgname-$_pkgname-$_pkgver"
  ./configure \
    --prefix=/usr \
    --with-buildstamp='Arch Linux'
  make
}

package() {
  cd "$srcdir/$_pkgname-$_pkgname-$_pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
