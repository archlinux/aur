# Maintainer: arch AT nnamuab DOT de
pkgname=phreeqc
pkgver=3.3.3
_pkgsvn=10424
pkgrel=2
pkgdesc="PHREEQC - A Computer Program for Speciation, Batch-Reaction, One-Dimensional Transport, and Inverse Geochemical Calculations"
arch=('i686' 'x86_64')
url="http://wwwbrr.cr.usgs.gov/projects/GWC_coupled/phreeqc/"
license=('custom')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install="install.sh"
changelog=
source=("ftp://brrftp.cr.usgs.gov/pub/charlton/phreeqc/phreeqc-$pkgver-$_pkgsvn.tar.gz"
        install.sh
        phreeqc.el
        "https://raw.githubusercontent.com/jaalto/project-emacs--folding-mode/master/folding.el")
md5sums=('b4b1f11e5855d3b034473ec51c76f7cc'
         '8facd6e784cd1985b2c57c092b753002'
         '81a6827b2d0d1d2675cbf4e117095208'
         'd262512bd4a19a68805914d35f8f9019')

build() {
  cd "$srcdir/$pkgname-$pkgver-$_pkgsvn"
  ./configure --prefix=/usr
  make -j8 CCFLAGS="-O3 -Wall -ansi -pedantic -DHAVE_ISFINITE -DNDEBUG -mtune=native"
}

package() {
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/share/emacs/site-lisp/$pkgname
  install -m755 ${srcdir}/$pkgname-$pkgver-$_pkgsvn/src/phreeqc ${pkgdir}/usr/bin

  mkdir -p ${pkgdir}/usr/share/phreeqc/examples
  mkdir -p ${pkgdir}/usr/share/phreeqc/doc
  mkdir -p ${pkgdir}/usr/share/phreeqc/test
  mkdir -p ${pkgdir}/usr/share/phreeqc/database
  install -m644 ${srcdir}/$pkgname-$pkgver-$_pkgsvn/database/* ${pkgdir}/usr/share/phreeqc/database/
  install -m644 ${srcdir}/$pkgname-$pkgver-$_pkgsvn/test/* ${pkgdir}/usr/share/phreeqc/test/
  install -m644 ${srcdir}/$pkgname-$pkgver-$_pkgsvn/doc/* ${pkgdir}/usr/share/phreeqc/doc/
  install -m644 ${srcdir}/$pkgname-$pkgver-$_pkgsvn/examples/* ${pkgdir}/usr/share/phreeqc/examples

  install -m644 phreeqc.el ${pkgdir}/usr/share/emacs/site-lisp/$pkgname
  install -m644 folding.el ${pkgdir}/usr/share/emacs/site-lisp/$pkgname
}

# vim:set ts=2 sw=2 et:
