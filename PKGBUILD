# Maintainer: Dan Printzell <me@vild.io>

pkgname=('workspace-d-git')
pkgver=2.11.0.r0.76224e3
pkgrel=1
pkgdesc="Wraps dcd, dfmt and dscanner to one unified environment managed by dub"
arch=('i686' 'x86_64')
url="https://github.com/Pure-D/workspace-d"
license=("MIT")
groups=('dlang')
makedepends=('dmd' 'git' 'dub')
depends=('libphobos' 'dub' 'dcd' 'dfmt' 'dscanner')
provides=('workspace-d')
conflicts=('workspace-d')

source=(
	"git+https://github.com/Pure-D/workspace-d"
)
sha256sums=(
	'SKIP'
)

pkgver() {
	cd "$srcdir/workspace-d"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g;s/\.rc./rc/g'
}

prepare() {
	cd "$srcdir/workspace-d"
	dub upgrade
}

build() {
	cd "$srcdir/workspace-d"
	dub build
}

package() {
	# binaries
	install -Dm755 "$srcdir/workspace-d/workspace-d" "$pkgdir/usr/bin/workspace-d"

	# license
	install -Dm644 "$srcdir/workspace-d/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
