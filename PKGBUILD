# Maintainer: Ernesto Castellotti <mail@ernestocastellotti.it>
# Contributor: Dan Printzell <me@vild.io>

pkgname=('serve-d')
pkgver=0.6.0
pkgrel=1
pkgdesc="Microsoft language server protocol implementation for D using workspace-d"
arch=('x86_64')
url="https://github.com/Pure-D/serve-d"
license=("MIT")
groups=('dlang')
makedepends=('ldc' 'git' 'dub' 'dtools')
depends=('liblphobos' 'dcd')

source=(
	"https://github.com/Pure-D/serve-d/archive/v${pkgver}.tar.gz"
)
sha256sums=(
	'b668827d3c91d4acd0c1d2058327d24bd0cca341052b6ec93887b880d86b8d30'
)

prepare() {
	cd "$srcdir/serve-d-${pkgver}"
	dub upgrade
}

build() {
	cd "$srcdir/serve-d-${pkgver}"
	dub build --build=release --compiler=ldc
}

package() {
	# binaries
	install -Dm755 "$srcdir/serve-d-${pkgver}/serve-d" "$pkgdir/usr/bin/serve-d"

	# license
	install -Dm644 "$srcdir/serve-d-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
	
