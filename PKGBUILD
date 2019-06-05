# Maintainer: Michael Hansen <zrax0111 gmail com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=swig3
_pkgname=swig
pkgver=3.0.12
pkgrel=1
pkgdesc="Generate scripting interfaces to C/C++ code"
arch=('x86_64')
url="http://www.swig.org/"
license=('custom')
depends=('pcre' 'gcc-libs')
checkdepends=('ruby' 'python2' 'java-environment' 'tcl' 'php' 'lua' 'ocaml' 'r' 'go' 'python2-cffi' 'camlp4')
source=(https://downloads.sourceforge.net/${_pkgname}/${_pkgname}-${pkgver}.tar.gz)
sha1sums=('5cc1af41d041e4cc609580b99bb3dcf720effa25')

build() {
  cd ${_pkgname}-${pkgver}
  ./configure --prefix=/usr --program-suffix="-3"
  make
}

check() {
  cd ${_pkgname}-${pkgver}
  make check || warning "Tests failed"
}

package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
  install -D -m644 LICENSE-UNIVERSITIES "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE-UNIVERSITIES
}
