# Maintainer: Dan Printzell <xwildn00bx@gmail.com>

pkgname=('dfmt-git')
pkgver=r314.8035bee
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
	"git+https://github.com/Hackerpilot/dfmt"
)
sha256sums=(
	'SKIP'
)

pkgver() {
	cd $srcdir/dfmt
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd $srcdir/dfmt
	git submodule update --init --recursive
}

build() {
	cd $srcdir/dfmt
	make
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
