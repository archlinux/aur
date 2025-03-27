# Maintainer: Emily <info@emy.sh>
# Contributor: Dan Printzell <me@vild.io>

pkgname=('serve-d')
pkgver=0.7.6
pkgrel=1
pkgdesc="Microsoft language server protocol implementation for D using workspace-d"
arch=('x86_64')
url="https://github.com/Pure-D/serve-d"
license=("MIT")
groups=('dlang')
makedepends=('ldc' 'git' 'dub' 'dtools' 'dmd')
depends=('liblphobos' 'dcd')

source=(
	"https://github.com/Pure-D/serve-d/archive/v${pkgver}.tar.gz"
)
sha256sums=(
	'8150b28b20f26baae17ea668a9a3ca815de4a893cf471f977550c475a7d444ea'
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
	
