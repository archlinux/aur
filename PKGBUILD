# Maintainer: Dan Printzell <xwildn00bx@gmail.com>

pkgname=('dfmt')
pkgver=0.4.2
pkgrel=1
pkgdesc="Dfmt is a formatter for D source code "
arch=('i686' 'x86_64')
url="https://github.com/Hackerpilot/dfmt"
license=("BSL")
groups=('dlang')
makedepends=('dmd' 'git')
depends=('libphobos')
provides=('dfmt')
conflicts=('dfmt')
options=('!strip')

source=(
	"git+https://github.com/Hackerpilot/dfmt#tag=v${pkgver}"
)
sha256sums=(
	'SKIP'
)

prepare() {
	cd $srcdir/dfmt
	git submodule update --init --recursive
}

build() {
	cd $srcdir/dfmt
	make

	strip bin/dfmt
}

package(){
	cd $srcdir/dfmt

	# binaries
	mkdir -p $pkgdir/usr/bin
	install -m755 -t $pkgdir/usr/bin ./bin/dfmt

	# license
	mkdir -p $pkgdir/usr/share/licenses/${pkgname}
	install -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
