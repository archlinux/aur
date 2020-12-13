# Maintainer:  <reg-archlinux AT klein DOT tuxli DOT ch> 
_pkgname=amb
pkgname=${_pkgname}-svn
pkgver=r119
pkgrel=1
pkgdesc='AMB stands for Ancient Machines Book. It is an extremely lightweight file format meant to store any kind of hypertext documentation '
url='http://ambook.sourceforge.net/'
license=('MIT')
arch=('x86_64' 'aarch64')
conflicts=(${_pkgname})
makedepends=('subversion' 'tar' 'make' 'gcc' 'sed') 
source=("svn+https://svn.code.sf.net/p/ambook/code/${_pkgname}/trunk")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/trunk"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

prepare() {
	cd ${srcdir}"/trunk/"
	sed -n '/.*LICENSE.*/,$p' ${_pkgname}.txt > LICENSE
}

build() {
	cd ${srcdir}"/trunk/"
	make 
}

package() {
	mkdir -p "${pkgdir}/usr/bin/"
	cd ${srcdir}"/trunk/"
	mv ${_pkgname}	${pkgdir}/usr/bin/
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
