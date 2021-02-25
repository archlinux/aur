# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Eric Belanger <belanger@astro.umontreal.ca>
# Contributor: Ravi Desai <ravster3@hotmail.com>

pkgname=xfe-arch
_pkgname=xfe
pkgver=1.43.2
pkgrel=1
pkgdesc="An MS-Explorer like file manager for X with Archlinux xfp support."
arch=('i686' 'x86_64')
url="http://roland65.free.fr/xfe"
license=("GPL")
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
depends=('fox' 'xcb-util')
makedepends=('intltool')
source=("http://downloads.sourceforge.net/sourceforge/$_pkgname/$_pkgname-$pkgver.tar.gz"
	"arch-pacman.patch")
md5sums=('1aedf48862c5170695714f18b3e7a398'
         '109d9a6de10865a7f2104c43d8eef94a')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  patch -Np2 -b -z .orig <../arch-pacman.patch
  autoupdate
  aclocal
  automake --add-missing
  autoreconf
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./configure --prefix=/usr
  make V=0
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
md5sums=('246214140eca11079d97988c4e9fc9fc'
         '109d9a6de10865a7f2104c43d8eef94a')
