# Maintainer: Adrien Prost-Boucle <adrien.prost-boucle@laposte.net>

pkgname=ghdl-llvm-hg
pkgver=0.33.hg900
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='VHDL simulator - LLVM version'
url='http://sourceforge.net/projects/ghdl-updates/'
license=('GPLv2')

provides=('ghdl')
conflicts=('ghdl' 'ghdl-hg' 'ghdl-mcode-hg')
makedepends=('gcc-ada' 'mercurial' 'llvm35' 'clang35')

source=(
	"ghdl::hg+http://hg.code.sf.net/p/ghdl-updates/code"
)
md5sums=(
	'SKIP'
)

pkgver() {
	cd "${srcdir}/ghdl"

	# GHDL version (extracted from version.ads)
	_distver=`sed -n -e 's/.*GHDL \([0-9.a-z]*\) (.*/\1/p' src/version.ads`
	# Changeset number (asked to mercurial)
	_hgver=`hg log -l1 | sed -n -e 's/.*changeset:\s*\([0-9]*\).*/\1/p'`

	echo $_distver.hg$_hgver;
}

build() {
	cd "${srcdir}/ghdl"

	./configure --prefix=/usr/ --with-llvm=/usr/

	make

}

package() {
	cd "${srcdir}/ghdl"

	make DESTDIR="${pkgdir}" install

}
