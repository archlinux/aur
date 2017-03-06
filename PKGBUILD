# Maintainer: Dan Printzell <me@vild.io>

pkgname=('serve-d-git')
pkgver=r2.bd7cdff
pkgrel=1
pkgdesc="Microsoft language server protocol implementation for D using workspace-d"
arch=('i686' 'x86_64')
url="https://github.com/Pure-D/serve-d"
license=("MIT")
groups=('dlang')
makedepends=('dmd' 'git' 'dub')
depends=('libphobos' 'dub' 'dcd' 'dfmt' 'dscanner')
provides=('serve-d')
conflicts=('serve-d')

source=(
	"git+https://github.com/Pure-D/serve-d"
)
sha256sums=(
	'SKIP'
)

pkgver() {
	cd $srcdir/serve-d
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd $srcdir/serve-d
	git submodule update --init --recursive
	dub upgrade
}

build() {
	cd $srcdir/serve-d
	dub build --cache=local
	strip serve-d
}

package(){
	cd $srcdir/serve-d

	# binaries
	mkdir -p $pkgdir/usr/bin
	install -m755 -t $pkgdir/usr/bin ./serve-d
}
