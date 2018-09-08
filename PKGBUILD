# Maintainer: Uwe Koloska <kolewu [at] koloro [dot] de>
# Contributor: Dejan Cabrilo <dcabrilo [at] bitspan [dot] rs>

pkgname=tdom
pkgver=0.9.1
pkgrel=3
pkgdesc="A fast XML/DOM/XPath package for Tcl written in C"
arch=('i686' 'x86_64')
url="http://tdom.org"
license=('MPL')
groups=('devel')
depends=('tcl'
	 'gumbo-parser')
source=(http://tdom.org/downloads/tdom-${pkgver}-src.tgz
	no-build-dir.patch)
md5sums=('53d030649acd82e01720bbe82b3bf0b1'
         '3e3fc79c2cfea54e1dd128ea3acddbca')
sha256sums=('3b1f644cf07533fe4afaa8cb709cb00a899d9e9ebfa66f4674aa2dcfb398242c'
            '45c8c54582b55af785c10019271c53cdab0c2a1e4cc858c12af8e217f00cdb48')


prepare() {
  cd "${pkgname}-$pkgver"

  patch -p0 -i "$srcdir"/no-build-dir.patch
}

build() {
  cd "${pkgname}-$pkgver"
  
  if [ $CARCH = "x86_64" ] ; then
    ./configure --prefix=/usr --enable-64bit --enable-html5
  else
    ./configure --prefix=/usr
  fi
  make
}

check() {
  cd "${pkgname}-$pkgver"
  make test
}

package() {
  cd "${pkgname}-$pkgver"
  
  make DESTDIR="$pkgdir/" install
  # rm empty directory
  rmdir "$pkgdir/usr/bin"
}
