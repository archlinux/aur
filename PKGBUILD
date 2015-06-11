# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Eric Belanger <belanger@astro.umontreal.ca>
# Contributor: Ravi Desai <ravster3@hotmail.com>

pkgname=xfe-arch
_pkgname=xfe
pkgver=1.37
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
md5sums=('ce2a317ab4f7d728878d815afe13c1be'
         '513b73351f65137f8796934dc041b8e9')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  patch -Np1 -b -z .orig <../arch-yaourt.patch
  sed -i 's|freetype/config/ftheader.h|config/ftheader.h|g' configure.ac
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
