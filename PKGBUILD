# Maintainer: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)
# Contributor: orbisvicis <''.join(chr(ord(c)-1) for c in "pscjtwjdjtAhnbjm/dpn")>
_pkgname=gigedit
pkgname=$_pkgname-svn
pkgver=0.r2676
pkgrel=1
pkgdesc="An instrument editor for gigasampler files"
arch=("i686" "x86_64")
url="http://www.linuxsampler.org/"
license=("GPL")
depends=("gtkmm3" "linuxsampler-svn")
makedepends=("subversion" "intltool" "docbook-xsl")
source=("$pkgname"::"svn+https://svn.linuxsampler.org/svn/$_pkgname/trunk")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  local ver="$(svnversion)"
  printf "0.r%s" "${ver//[[:alpha:]]}"
}

prepare() {
  cd "$srcdir/$pkgname"
  make -f Makefile.cvs
}

build() {
  cd "$srcdir/$pkgname"
  ./configure --prefix=/usr --disable-static
  make
}


package() {
  cd "$srcdir/$pkgname"
  make DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
