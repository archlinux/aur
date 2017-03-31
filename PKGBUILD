# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Eric Belanger <belanger@astro.umontreal.ca>
# Contributor: Ravi Desai <ravster3@hotmail.com>

pkgname=xfe-arch
_pkgname=xfe
pkgver=1.42
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
md5sums=('34326f185070db02e7419f85f7967cdf'
         '680403ddc2a748b2fb304080b945ac45')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  patch -Np2 -b -z .orig <../arch-yaourt.patch
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
