#PKGBUILD Maintainer: Rafael Reggiani Manzo <rr.manzo#gmail.com>

pkgname=doxyparse
_actual_ver=1.5.9
_extra_ver=20090622
pkgver=${_actual_ver}_${_extra_ver}
pkgrel=4
pkgdesc="Parses source code and dumps the dependencies between the code elements."
groups=('analizo')
arch=('any')
url="http://analizo.org"
license=('GPLv2')
makedepends=('qt4' 'git' 'flex')
source=("qtools.patch")
sha512sums=('8095af5f6ba616864be6389b4245ab7a3a3723298635831c4f714468d6768cf86a382802ad8189053414f7701654ef683d1342936a31b98208ebf78f5e92485a')

build(){
  cd "${srcdir}"

  git clone https://gitlab.com/analizo/doxyparse.git
  cp "${srcdir}/qtools.patch" doxyparse
  cd doxyparse
  git apply qtools.patch
  ./configure --with-doxyparse
  make
}

check() {
  cd "${srcdir}/${pkgname}"

  make check || :
}

package(){
  cd "${srcdir}/${pkgname}"

  make DESTDIR="${pkgdir}/" install
}

