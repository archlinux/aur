# Maintainer: actionless <actionless DOT loveless PLUS aur AT gmail MF com>

pkgname=geh-git
pkgver=0.4.0.r9.g26bfe3a
pkgrel=4
pkgdesc="A simple command line image viewer written in C/GTK3
with various nice features."
arch=('x86_64' 'i686')
url="https://github.com/software-revive/geh-rv"
license=('MIT')
source=(
	"geh::git+${url}.git#branch=master"
)
md5sums=('SKIP')
depends=(
	'gtk3'
)
makedepends=(
	'git'
)
optdepends=()
provides=('geh')
conflicts=(
	'geh'
	'geh-gtk2'
	'geh-gtk2-git'
)

pkgver() {
	cd "$srcdir/geh"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/geh"
	./autogen.sh
	./configure --prefix="$pkgdir" --disable-gtk2
	make
}

package() {
	cd "$srcdir/geh"
	make install
	### fix prefix dir:
	mkdir -p "$pkgdir/usr/"
	mv "$pkgdir"/{bin,share} "$pkgdir/usr/"
	### move license file:
	install -Dm644 "$pkgdir/usr/share/doc/geh/LICENSE" "$pkgdir/usr/share/licenses/geh/LICENSE"
	rm "$pkgdir/usr/share/doc/geh/LICENSE"
}

# vim: ft=PKGBUILD
