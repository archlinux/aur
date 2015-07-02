# Maintainer: Christoph J. Thompson <thompsonc@protonmail.ch>

_pkg=pidgin-musictracker
pkgname=${_pkg}-mpris2
pkgver=0.4.22
pkgrel=7
pkgdesc="A plugin for Pidgin which displays the music track currently playing."
url='http://code.google.com/p/pidgin-musictracker'
license=('GPL2')
depends=('pidgin' 'gtk2' 'dbus-glib')
makedepends=('xmms2')
arch=('i686' 'x86_64')
source=("http://pidgin-musictracker.googlecode.com/files/${_pkg}-${pkgver}.tar.bz2"
 pidgin-musictracker-mpris2.diff
 pidgin-musictracker-0.4.22-makefile.patch)
options=('!libtool')
md5sums=('8d7225c705484db86b864cab5a536423'
         '76ae16c0b217c5ba1197ea7037561803'
         '593b730a9108564bfcdb9b03e7459a75')

prepare() {
  cd "$srcdir/$_pkg-$pkgver"
  cat "${srcdir}/${source[1]}" | patch -p1 -s
  cat "${srcdir}/${source[2]}" | patch -p1 -s
}

build() {
  cd "$srcdir/$_pkg-$pkgver"
  ./configure --prefix=/usr
  make CFLAGS="$CFLAGS -Wno-deprecated-declarations"
}

package() {
  cd "$srcdir/$_pkg-$pkgver"
  make DESTDIR="$pkgdir" install
}

