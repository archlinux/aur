# Maintainer: Dan Printzell <arch@vild.io>

pkgname=('dfmt')
pkgver=0.5.0
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
	"git+https://github.com/dlang-community/dfmt#tag=v${pkgver}"
)
sha256sums=(
	'SKIP'
)

prepare() {
	cd "$srcdir/dfmt"
	git submodule update --init --recursive
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
