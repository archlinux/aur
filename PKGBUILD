# Contributor: Alexej Magura <agm2819*gmail*>
# Contributor: Theomachos <theomachos[at]pindundin[dot]de>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=clisp-new-clx
_pkgname=clisp
pkgver=2.49
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
source=("http://downloads.sourceforge.net/sourceforge/clisp/clisp-${pkgver}.tar.bz2")
md5sums=('1962b99d5e530390ec3829236d168649')

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

