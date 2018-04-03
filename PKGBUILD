# Maintainer: Dan Printzell <me@vild.io>

pkgname=('serve-d')
pkgver=0.1.2
pkgrel=1
pkgdesc="Wraps dcd, dfmt and dscanner to one unified environment managed by dub"
arch=('x86_64')
url="https://github.com/Pure-D/serve-d"
license=("MIT")
groups=('dlang')
makedepends=('dmd' 'git' 'dub')
depends=('libphobos' 'dcd')

source=(
	"git+https://github.com/Pure-D/serve-d#tag=v${pkgver}"
)
sha256sums=(
	'SKIP'
)

prepare() {
	cd "$srcdir/serve-d"
	dub upgrade
}

build() {
	cd "$srcdir/serve-d"
	dub build
}

package() {
	# binaries
	install -Dm755 "$srcdir/serve-d/serve-d" "$pkgdir/usr/bin/serve-d"

	# license
	install -Dm644 "$srcdir/serve-d/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
