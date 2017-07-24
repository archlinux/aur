# Maintainer: Dan Printzell <arch@vild.io>

pkgname=('dfmt-git')
pkgver=r419.ea72aa5
pkgrel=1
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
)
sha256sums=(
	'SKIP'
)

pkgver() {
	cd "$srcdir/dfmt"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

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
