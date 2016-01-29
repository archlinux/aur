# Maintainer: Dan Printzell <xwildn00bx@gmail.com>

pkgname=("dinu")
pkgver=1.0.2
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
	"git+https://github.com/weltensturm/dinu#tag=v${pkgver}"
	"https://github.com/weltensturm/dinu/pull/4.patch"
)
sha256sums=(
	"SKIP"
	"252e2aca3a23508d7bb055dfccd9d83a13749fefd5e02affa759158e2861819c"
)

prepare() {
	cd $srcdir/dinu
	patch -Np1 -i $srcdir/4.patch
}

build() {
	cd $srcdir/dinu
	dub build --cache=local

	strip ./bin/dinu
}

package() {
	cd $srcdir/dinu

	# binaries
	mkdir -p $pkgdir/usr/bin
	install -m755 -t $pkgdir/usr/bin ./bin/dinu
	install -m755 -t $pkgdir/usr/bin ./complete.sh
}
