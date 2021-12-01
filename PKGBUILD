# Maintainer: Ernesto Castellotti <mail@ernestocastellotti.it>
# Contributor: Dan Printzell <me@vild.io>

pkgname=('serve-d')
pkgver=0.7.0
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
	'8ce1972fc218fa74addfd9b747bd1147ce56637a8eb0b933f6618575e01aa106'
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
	
