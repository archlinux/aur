#PKGBUILD Maintainer: Rafael Reggiani Manzo <rr.manzo#gmail.com>

pkgname=doxyparse
_actual_ver=1.5.9
_extra_ver=20090622
_relase=1899087a8b26293bec2c31e238098d968add7d0b
pkgver=${_actual_ver}_${_extra_ver}
pkgrel=5
pkgdesc="Parses source code and dumps the dependencies between the code elements."
groups=('analizo')
arch=('any')
url="http://analizo.org"
license=('GPLv2')
makedepends=('qt4' 'git' 'flex')
source=("0001-Fix-Flex-version-compilation-restriction.patch")
sha512sums=('9c3f836ede511108d3af78d316854dc386a188f5a59add6d5e7df272abdaa4f93a2b2147617e2d46716065c51f149638977269a14ceef6fc12c02c7b3eac33e4')

build(){
  cd "${srcdir}"

  git clone https://github.com/analizo/doxyparse.git
  cp "${srcdir}/0001-Fix-Flex-version-compilation-restriction.patch" doxyparse
  cd doxyparse
  git checkout "${release}"
  git apply 0001-Fix-Flex-version-compilation-restriction.patch
  cmake .
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

