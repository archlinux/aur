# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Rafael Ferreira <josephgbr@archlinux.info>

pkgname=libgnomeprint
pkgver=2.18.8
pkgrel=8
pkgdesc='Printing routines for GNOME'
url='http://www.gnome.org/'
arch=('x86_64' 'i686')
license=('LGPL' 'GPL')
depends=('pango' 'libart-lgpl' 'libxml2' 'libgnomecups' 'libgcrypt' 'bzip2')
makedepends=('intltool' 'pkgconfig' 'addinclude')
replaces=('libgnomeprint-cups')
conflicts=('libgnomeprint-cups')
options=('!libtool')
source=("http://ftp.gnome.org/pub/gnome/sources/$pkgname/2.18/$pkgname-$pkgver.tar.bz2"
        "http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/gnome-base/libgnomeprint/files/libgnomeprint-2.18.8-bison3.patch"
        "patch-freetype-2.5.1.diff")
sha256sums=('1034ec8651051f84d2424e7a1da61c530422cc20ce5b2d9e107e1e46778d9691'
            'f90696e4ee1f4fb49bd3a3fe62e3443efef6f4918aeaf7586cab692a035463c3'
            '2f563a5fd6917d506cc11a5e22d09225e161d3bfe747fb6021338e623ed0c844')

prepare() {
  cd "$pkgname-$pkgver"

  patch -p0 -i "$srcdir/patch-freetype-2.5.1.diff"
  addinclude "$pkgname/modules/cups/gnome-print-cups-transport.c" stdio
  cd "$srcdir"
  patch -p0 -i libgnomeprint-2.18.8-bison3.patch
}

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr --disable-static
  make
}

package() {
  make -C "$pkgname-$pkgver" DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
