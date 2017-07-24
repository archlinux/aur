# Maintainer: Dan Printzell <arch@vild.io>

pkgname=('dfmt')
pkgver=0.5.0
pkgrel=3
pkgdesc="Dfmt is a formatter for D source code "
arch=('i686' 'x86_64')
url="https://github.com/dlang-community/dfmt"
license=("BSL")
groups=('dlang')
makedepends=('dmd' 'git')
depends=('libphobos')

source=(
	"git+https://github.com/dlang-community/dfmt#tag=v$pkgver"
	"git+https://github.com/Hackerpilot/libdparse"
)
sha256sums=(
	'SKIP'
	'SKIP'
)

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
