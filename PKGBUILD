# Contributor: Tom Tobin <archlinux@tomxtobin.com>

pkgname=cl-dpans3r-info
pkgver=1.05
pkgrel=2
pkgdesc="The draft ANSI Common Lisp standard (dpANS3R) in Texinfo format"
arch=('any')
url="http://www.phys.au.dk/~harder/dpans.html"
license=('GPL2')
makedepends=('emacs' 'texinfo-legacy')
install=${pkgname}.install
source=(http://www.phys.au.dk/~harder/dpans2texi-${pkgver}.tar.gz
        http://quimby.gnus.org/circus/cl/dpANS3.tar.gz
        http://quimby.gnus.org/circus/cl/dpANS3R.tar.gz)
sha256sums=('c84da02ce39eb7100ea7bcf40ad51502ee5c43eb0cd4747594ecf9a6fde9288f'
            '246ec5da4b051e83051f9f3bdc05a44178fa34b8c704eb85a3b5ecc0c3906295'
            '622e2577e79dbea26d6ad63f936979d6b6fe6f47e30d4efa2109a39c3f2b4473')

_build_dir() {
  echo -n ${srcdir}/dpans2texi-${pkgver}
}

prepare() {
  cd $(_build_dir)
  cp ${srcdir}/dpANS3/*.tex .
  cp ${srcdir}/dpANS3R/*.tex .
}

build() {
  cd $(_build_dir)
  MAKEINFO=makeinfo-4.13a ./configure --prefix=/usr || return 1
  make || return 1
}

package() {
  cd $(_build_dir)
  make prefix=${pkgdir}/usr install-info || return 1
}
