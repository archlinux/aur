# Maintainer: Ernesto Castellotti <mail@ernestocastellotti.it>
# Contributor: Dan Printzell <me@vild.io>

pkgname=('serve-d')
pkgver=0.7.5
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
	'defa45aeb9a3c2dcbbf26f204088398d1cf4f74dd97762eb3d26ced8f257251c'
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
	
