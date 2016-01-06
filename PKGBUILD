# Maintainer: Dan Printzell <me@vild.io>

pkgname=('workspace-d')
pkgver=1.2.0
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
	"git+https://github.com/Pure-D/workspace-d#tag=v1.2.0"
)
sha256sums=(
	'SKIP'
)

prepare() {
	cd $srcdir/workspace-d
	git submodule update --init --recursive
}

build() {
	cd $srcdir/workspace-d
	dub build
	strip workspace-d
}

package(){
	cd $srcdir/workspace-d

	# binaries
	mkdir -p $pkgdir/usr/bin
	install -m755 -t $pkgdir/usr/bin ./workspace-d
}
