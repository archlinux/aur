# Maintainer: Kaare Jenssen <kaare at jenssen dot it>
# Contributor: Alexej Magura <agm2819*gmail*>
# Contributor: Theomachos <theomachos[at]pindundin[dot]de>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=clisp-new-clx
_pkgname=clisp-clisp
pkgver=2.50
pkgrel=5
pkgdesc="ANSI Common Lisp interpreter, compiler and debugger"
arch=('i686' 'x86_64')
license=('GPL')
url="http://clisp.cons.org/"
depends=('readline' 'libsigsegv')
provides=('common-lisp' 'clisp')
conflicts=('clisp')
makedepends=('ffcall')
options=('!makeflags' '!emptydirs')
source=(https://gitlab.com/gnu-clisp/clisp/-/archive/clisp-2.50/clisp-clisp-${pkgver}.tar.bz2)
md5sums=('e1813423a98973c2a43b3690c563c024')

build() {
  cd $srcdir/${_pkgname}-${pkgver}
  
  ./configure --prefix=/usr --with-readline \
	      --with-module=clx/new-clx --with-ffcall src
  cd src
  ./makemake --prefix=/usr --with-readline --with-module=clx/new-clx \
	     --with-ffcall --with-dynamic-ffi > Makefile
  make
  sed -i 's,http://www.lisp.org/HyperSpec/,http://www.lispworks.com/reference/HyperSpec/,g' config.lisp
  make
}

check() {
  cd $srcdir/${_pkgname}-${pkgver}/src
  make check
}

package() {
  cd $srcdir/${_pkgname}-${pkgver}/src
  make DESTDIR=$pkgdir install
}

