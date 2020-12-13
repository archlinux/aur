# Maintainer:  <reg-archlinux AT klein DOT tuxli DOT ch> 
_pkgname=openkropki
pkgname=${_pkgname}-svn
pkgver=r276
pkgrel=1
pkgdesc='OpenKropki is an open-source and multiplatform implementation of the kropki game. It runs on most POSIX systems. MIT license.'
url='http://openkropki.sourceforge.net/'
license=('MIT')
arch=('x86_64' 'aarch64')
conflicts=(openkropki)
depends=('sdl2_ttf' 'sdl2' 'zlib')
makedepends=('subversion' 'tar' 'make' 'gcc' 'sed') 
source=("svn+https://svn.code.sf.net/p/openkropki/code/trunk")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/trunk"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

prepare() {
  cd "$srcdir/trunk"
	sed -n '/.*MIT\ License.*/,$p' openkropki.txt > LICENSE
}

build() {
	cd ${srcdir}"/trunk/"
	make 
}

package() {
	mkdir -p "${pkgdir}/usr/bin/"
	cd ${srcdir}"/trunk/"
	mv openkropki	${pkgdir}/usr/bin/
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
