# Maintainer: Adrien Prost-Boucle <adrien.prost-boucle@laposte.net>

pkgname=ghdl-mcode-git
pkgver=0.37dev.git20190702
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='VHDL simulator - mcode backend'
url='https://github.com/tgingold/ghdl'
license=('GPLv2')

provides=('ghdl')
conflicts=('ghdl' 'ghdl-gcc-git' 'ghdl-llvm-git')
makedepends=('gcc-ada' 'git')

source=(
	"ghdl::git://github.com/ghdl/ghdl.git"
)
md5sums=(
	'SKIP'
)

pkgver() {
	cd "${srcdir}/ghdl"

	# GHDL version (extracted from configure)
	_distver=`sed -n -e 's/^ghdl_version=.*"\(.*\)".*/\1/p' configure | tr -d '-'`
	# Date of the last git commit
	_gitver=`git log -n 1 --date=short | sed -n -e 's/.*Date:\s*\([0-9-]*\).*/\1/p' | tr -d -`

	echo $_distver.git$_gitver;
}

build() {
	cd "${srcdir}/ghdl"

	./configure --prefix=/usr/

	make

}

package() {
	cd "${srcdir}/ghdl"

	make DESTDIR="${pkgdir}" install

}
