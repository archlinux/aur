# Maintainer: Sergio Correia <sergio@correia.cc>
# Contributor: Oleg Smirnov <oleg.smirnov@gmail.com>
# Contributor: Luke McCarthy <luke@iogopro.co.uk>

pkgname=tclcl
pkgver=1.20
pkgrel=4
pkgdesc="Tcl with classes (TclCl) is a Tcl/C++ interface"
url="http://otcl-tclcl.sourceforge.net/tclcl/"
license=('MIT')
depends=('gcc-libs')
makedepends=('otcl')
arch=('i686' 'x86_64')
options=('staticlibs')
source=(http://downloads.sourceforge.net/sourceforge/otcl-tclcl/tclcl-src-"${pkgver}".tar.gz
        tclcl-1.20-tcl86-compat.patch)
sha256sums=('64fd1ec4b1d1c13229e58a7e10bf8422d804c5d3f00221117eafc2aff306dc78'
            '8c1d4672013463ff9ccef0f064e739643a4ae50d2e3909e8943791ba8d1c275f')

prepare() {
  cd "${srcdir}"/"${pkgname}"-"${pkgver}"
  patch -uNp1 -i ../tclcl-1.20-tcl86-compat.patch
}

build() {
  cd "${srcdir}"/"${pkgname}"-"${pkgver}"
  ./configure --prefix="${pkgdir}"/usr/lib/tclcl
  make
}

package() {
  cd "${srcdir}"/"${pkgname}"-"${pkgver}"
  install -d "${pkgdir}"/usr/lib/tclcl
  install -d "${pkgdir}"/usr/lib/tclcl/bin
  install -d "${pkgdir}"/usr/lib/tclcl/include
  install -d "${pkgdir}"/usr/lib/tclcl/lib
  make install

  chmod 644 "${pkgdir}"/usr/lib/tclcl/lib/*.a
  ln -s bin/tcl2c++ "${pkgdir}"/usr/lib/tclcl/tcl2c++
}

# vim:set ts=2 sw=2 et:
