# Maintainer: Dan Printzell <me@vild.io>

pkgname=('serve-d-git')
pkgver=r911.172f231
pkgrel=1
pkgdesc="Microsoft language server protocol implementation for D using workspace-d"
arch=('i686' 'x86_64')
url="https://github.com/Pure-D/serve-d"
license=("MIT")
groups=('dlang')
makedepends=('dmd' 'git' 'dub' 'dtools')
depends=('libphobos' 'dub' 'dcd' 'dfmt' 'dscanner')
provides=('serve-d')
conflicts=('serve-d')

source=(
	"git+https://github.com/Pure-D/serve-d"
)
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/serve-d"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
