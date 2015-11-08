# $Id$
# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Marcus Schulderinsky <mmaacceess at gmail dot com>

pkgname=lxmusic-gtk3
_pkgname=lxmusic
pkgver=0.4.6
pkgrel=3
pkgdesc='Lightweight XMMS2 client (GTK+ 3 version)'
arch=('i686' 'x86_64')
url="http://lxde.org/"
license=('GPL')
groups=('lxde-gtk3')
depends=('gtk3' 'libnotify' 'xmms2')
makedepends=('intltool')
conflicts=($_pkgname)
source=(http://downloads.sourceforge.net/lxde/$_pkgname-$pkgver.tar.xz
        0001-Fix-some-deprecations-and-add-an-option-to-compile-w.patch
        0002-Don-t-use-GtkBuilder-for-popup-menu.patch)
md5sums=('38fc31793b11c43b6a8fda70faedfd54'
         '1db53931dd063b658594c69b211de581'
         '9abc6d17eddcdb1bfd007c7d9bfb0846')

prepare() {
  cd $_pkgname-$pkgver

  # Fix some deprecations and add an option to compile with gtk3
  patch -Np1 -i ../0001-Fix-some-deprecations-and-add-an-option-to-compile-w.patch
  patch -Np1 -i ../0002-Don-t-use-GtkBuilder-for-popup-menu.patch

  autoreconf -fi
}

build() {
  cd $_pkgname-$pkgver
  ./configure --prefix=/usr --enable-gtk3
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
