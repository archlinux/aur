# Maintainer: Dan Printzell <arch@vild.io>

pkgname=('dfmt-git')
pkgver=0.5.0.r4.ea72aa5
pkgrel=2
pkgdesc="Dfmt is a formatter for D source code "
arch=('i686' 'x86_64')
url="https://github.com/dlang-community/dfmt"
license=("BSL")
groups=('dlang')
makedepends=('dmd' 'git')
depends=('libphobos')
provides=('dfmt')
conflicts=('dfmt')

source=(
	"git+https://github.com/dlang-community/dfmt"
	"git+https://github.com/Hackerpilot/libdparse"
)
sha256sums=(
	'SKIP'
	'SKIP'
)

pkgver() {
	cd "$srcdir/dfmt"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g;s/\.rc./rc/g'
}

prepare() {
	cd "$srcdir/dfmt"

	git submodule init
	git config submodule.libdparse.url "$srcdir/libdparse"
	git submodule update
}

build() {
	cd "$srcdir/dfmt"
	make
}

package() {
	# binaries
	install -Dm755 "$srcdir/dfmt/bin/dfmt" "$pkgdir/usr/bin/dfmt"

	# license
	install -Dm644 "$srcdir/dfmt/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
