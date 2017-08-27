# Maintainer: Uwe Koloska <kolewu [at] koloro [dot] de>
# Contributor: Dejan Cabrilo <dcabrilo [at] bitspan [dot] rs>

pkgname=tdom
pkgver=0.9.0
pkgrel=1
pkgdesc="A fast XML/DOM/XPath package for Tcl written in C"
arch=('i686' 'x86_64')
url="http://www.tdom.org"
license=('MPL')
groups=('devel')
depends=('tcl')
source=(http://tdom.org/downloads/tdom-${pkgver}-src.tgz
	no-build-dir.patch)
md5sums=('22a1a4ad5fed6dfbe29c83083bf14d83'
         '3e3fc79c2cfea54e1dd128ea3acddbca')

prepare() {
  cd "$srcdir"/"${pkgname}-$pkgver"

  patch -p0 -i "$srcdir"/no-build-dir.patch
}

build() {
  cd "$srcdir"/"${pkgname}-$pkgver"
  
  if [ $CARCH = "x86_64" ] ; then
    ./configure --prefix=/usr --enable-64bit
  else
    ./configure --prefix=/usr
  fi
  make
}

package() {
  cd "$srcdir"/"${pkgname}-$pkgver"
  
  make DESTDIR="$pkgdir/" install
  rmdir "$pkgdir/usr/bin"
}
