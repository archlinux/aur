# Maintainer: Dan Printzell <me@vild.io>

pkgname=('dwin-git')
pkgver=r73.ca40bda
pkgrel=2
pkgdesc="A window manager written in D"
arch=('i686' 'x86_64')
url="https://github.com/vild/dwin"
license=("MIT")
groups=('dlang')
makedepends=('dmd' 'git' 'dub' 'libxcb')
depends=('libphobos' 'dub')
provides=('dwin')
conflicts=('dwin')

source=(
	"git+https://github.com/Vild/DWin"
)
sha256sums=(
	'SKIP'
)

pkgver() {
	cd "$srcdir/DWin"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/DWin"
	dub upgrade
}

build() {
	cd "$srcdir/DWin"
	dub build
}

package() {
	# binaries
	install -Dm755 "$srcdir/DWin/dwin" "$pkgdir/usr/bin/dwin"

	# license
	install -Dm644 "$srcdir/DWin/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	# scripts
	install -d "$pkgdir/usr/share/dwin/scripts"
	find "$srcdir/DWin/scripts/" -type f -exec install -m 644 "{}" "$pkgdir/usr/share/dwin/scripts" \;
}
