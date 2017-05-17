# Maintainer: Dan Printzell <xwildn00bx@gmail.com>

pkgname=('dscanner')
pkgver=0.4.0
pkgrel=1
pkgdesc="Swiss-army knife for D source code"
arch=('i686' 'x86_64')
url="https://github.com/dlang-community/D-Scanner"
license=("BSL")
groups=('dlang')
makedepends=('dmd' 'git')
depends=('libphobos')
provides=('dscanner')
conflicts=('dscanner')
options=('!strip')

source=(
	"git+https://github.com/dlang-community/D-Scanner#tag=v${pkgver}"
)
sha256sums=(
	'SKIP'
)

prepare() {
	cd $srcdir/D-Scanner
	git submodule update --init --recursive
}

build() {
	cd $srcdir/D-Scanner
	make

	strip bin/dscanner
}

package(){
	cd $srcdir/D-Scanner

	# binaries
	mkdir -p $pkgdir/usr/bin
	install -m755 -t $pkgdir/usr/bin ./bin/dscanner

	# license
	mkdir -p $pkgdir/usr/share/licenses/${pkgname}
	install -m644 LICENSE_1_0.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
