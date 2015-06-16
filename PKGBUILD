# Maintainer: Sergio Correia <sergio@correia.cc>
# Contributor: Oleg Smirnov <oleg.smirnov@gmail.com>
# Contributor: Luke McCarthy <luke@iogopro.co.uk>

pkgname=otcl
pkgver=1.14
pkgrel=5
pkgdesc="An extension to Tcl/Tk for object-oriented programming"
url="http://otcl-tclcl.sourceforge.net/otcl/"
license=('MIT')
depends=('tk')
makedepends=('libxt')
arch=('i686' 'x86_64')
options=('staticlibs')
source=(http://downloads.sourceforge.net/otcl-tclcl/otcl-src-"${pkgver}".tar.gz
        otcl-1.14-tcl86-compat.patch)
sha256sums=('c644aed47ccd7e082ad47388dc8a2412a0eceacbe81d8574e560a797b782b969'
            'ac355cabd47a408242a909a2f5c7ad8c522c22fabad1180c44197bb6ac1db3a6')

prepare() {
  cd "${srcdir}"/"${pkgname}"-"${pkgver}"
  patch -uNp1 -i ../otcl-1.14-tcl86-compat.patch
}

build() {
  # There's an odd issue when using several jobs to build this package,
  # making it fail during the link phase, every other time.
  MAKEFLAGS=-j1

  cd "${srcdir}"/"${pkgname}"-"${pkgver}"
  ./configure --prefix="${pkgdir}"/usr
  make
}

package() {
  cd "${srcdir}"/"${pkgname}"-"${pkgver}"
  make DESTDIR="${pkgdir}" install
  chmod 644 "${pkgdir}"/usr/lib/*.a
}

# vim:set ts=2 sw=2 et:
