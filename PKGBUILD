# Maintainer: Dan Printzell <me@vild.io>

pkgname=('dmailmanager-git')
pkgver=r2.e3d20be
pkgrel=3
pkgdesc="Manage mail using notmuch"
arch=('i686' 'x86_64')
url="https://github.com/Vild/DMailManager"
license=("MPLv2")
groups=('dlang')
makedepends=('dmd' 'git' 'dub')
depends=('libphobos')
provides=('dmailmanager')
conflicts=('dmailmanager')

source=(
	"git+https://github.com/Vild/DMailManager"
)
sha256sums=(
	'SKIP'
)

pkgver() {
	cd "$srcdir/DMailManager"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/DMailManager"
	dub upgrade
}

build() {
	cd "$srcdir/DMailManager"
	dub build
}

package() {
	# binaries
	install -Dm755 "$srcdir/DMailManager/dmailmanager" "$pkgdir/usr/bin/dmailmanager"
}
