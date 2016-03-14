# Maintainer: Dan Printzell <xwildn00bx@gmail.com>

pkgname=("dinu-git")
pkgver=r46.c54ad0f
pkgrel=1
pkgdesc="Launcher, file manager, one-way terminal"
arch=("i686" "x86_64")
url="https://github.com/weltensturm/dinu"
license=("MIT")
groups=("dlang")
makedepends=("dmd" "git" "dub")
depends=("libphobos")
provides=("dinu")
conflicts=("dinu")
options=("!strip")

source=(
	"git+https://github.com/weltensturm/dinu"
)
sha256sums=(
	"SKIP"
)

pkgver() {
	cd $srcdir/dinu
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd $srcdir/dinu
	dub upgrade
}

build() {
	cd $srcdir/dinu
	dub build

	strip ./bin/dinu
}

package() {
	cd $srcdir/dinu

	# binaries
	mkdir -p $pkgdir/usr/bin
	install -m755 -t $pkgdir/usr/bin ./bin/dinu
	install -m755 -t $pkgdir/usr/bin ./complete.sh
}
