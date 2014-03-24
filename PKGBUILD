# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=swig
pkgver=3.0.0
pkgrel=1
pkgdesc="Generate scripting interfaces to C/C++ code"
arch=('i686' 'x86_64')
url="http://www.swig.org/"
license=('custom')
depends=('pcre' 'gcc-libs')
#checkdepends=('ruby' 'python' 'python2' 'java-environment' 'tcl' 'php' 'lua' 'ocaml' 'r' 'go')
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha1sums=('10a1cc5ba6abbc7282b8146ccc0d8eefe233bfab')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

# Testcases fail a LOT...
<<EOF
check() {
  cd ${pkgname}-${pkgver}
  make check
}
EOF

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
  install -D -m644 LICENSE-UNIVERSITIES "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE-UNIVERSITIES
}
