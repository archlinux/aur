# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Eric Belanger <belanger@astro.umontreal.ca>
# Contributor: Ravi Desai <ravster3@hotmail.com>

pkgname=xfe-arch
_pkgname=xfe
pkgver=1.41
pkgrel=1
pkgdesc="An MS-Explorer like file manager for X with Archlinux xfp support."
arch=('i686' 'x86_64')
url="http://roland65.free.fr/xfe"
license=("GPL")
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
depends=('fox' 'desktop-file-utils')
makedepends=('intltool')
optdepends=('yaourt: xfp archlinux support')
install="$_pkgname.install"
source=("http://downloads.sourceforge.net/sourceforge/$_pkgname/$_pkgname-$pkgver.tar.gz"
	"arch-yaourt.patch")
md5sums=('cd4978240decbf0449f07c5061b9c4b8'
         '6f1401fe5a2fb101ff3d5cbf3bca28d7')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  patch -Np1 -b -z .orig <../arch-yaourt.patch
  aclocal
  automake --add-missing
  autoreconf
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
