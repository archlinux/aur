# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=swig
pkgver=3.0.3
pkgrel=1
pkgdesc="Generate scripting interfaces to C/C++ code"
arch=('i686' 'x86_64')
url="http://www.swig.org/"
license=('custom')
depends=('pcre' 'gcc-libs')
checkdepends=('ruby' 'python2' 'java-environment' 'tcl' 'php' 'lua' 'ocaml' 'r' 'go' 'python2-cffi' 'camlp4')
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha1sums=('e68e1fbdf92ae34c0949c9babef10c8800377b93')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

check() {
  cd ${pkgname}-${pkgver}
  make check || warning "Tests failed"
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
  install -D -m644 LICENSE-UNIVERSITIES "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE-UNIVERSITIES
}
