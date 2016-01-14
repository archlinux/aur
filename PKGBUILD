# Maintainer: Dan Printzell <xwildn00bx@gmail.com>

pkgname=('dscanner')
pkgver=0.3.0
pkgrel=1
pkgdesc="Swiss-army knife for D source code"
arch=('i686' 'x86_64')
url="https://github.com/Hackerpilot/Dscanner"
license=("BSL")
groups=('dlang')
makedepends=('dmd' 'git')
depends=('libphobos')
provides=('dscanner')
conflicts=('dscanner')
options=('!strip')

source=(
	"git+https://github.com/Hackerpilot/Dscanner#tag=v${pkgver}"
)
sha256sums=(
	'SKIP'
)

prepare() {
	cd $srcdir/Dscanner
	git submodule update --init --recursive
}

build() {
	cd $srcdir/Dscanner
	make

	strip bin/dscanner
}

package(){
	cd $srcdir/Dscanner

	# binaries
	mkdir -p $pkgdir/usr/bin
	install -m755 -t $pkgdir/usr/bin ./bin/dscanner

	# license
	mkdir -p $pkgdir/usr/share/licenses/${pkgname}
	install -m644 LICENSE_1_0.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
