# Maintainer: Vladimir Panteleev <arch-pkg at thecybershadow.net>
_pkgname=pngtools
pkgname=$_pkgname-svn
pkgver=r3378
pkgrel=1
pkgdesc="a suite of commands to make PNG easier to use"
arch=('i686' 'x86_64')
url="http://www.stillhq.com/pngtools/"
license=('GPL')
depends=('libpng')
provides=($_pkgname)
conflicts=($_pkgname)
source=("svn+http://www.stillhq.com/svn/trunk/pngtools/")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

prepare() {
  cd "$srcdir/$_pkgname"
  cat <<EOF >> Makefile.am

man_MANS = man/pnginfo.3 man/pngcp.3 man/pngchunkdesc.3
EOF
}

build() {
  cd "$srcdir/$_pkgname"

  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir/" install
}
