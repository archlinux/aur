# Maintainer: actionless <actionless DOT loveless PLUS aur AT gmail MF com>

pkgname=geh-gtk2-git
pkgver=0.4.0.r9.g26bfe3a
pkgrel=2
pkgdesc="A simple command line image viewer written in C/GTK2
with various nice features."
arch=('x86_64' 'i686')
url="https://github.com/software-revive/geh-rv"
license=('MIT')
source=(
	"geh::git+${url}.git#branch=master"
)
md5sums=('SKIP')
depends=(
	'gtk2'
)
makedepends=(
	'git'
)
optdepends=()
provides=('geh')
conflicts=(
	'geh'
	'geh-git'
	'geh-gtk2'
)

pkgver() {
	cd "${srcdir}/geh"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/geh"
	./autogen.sh
	./configure --prefix="$pkgdir" --enable-gtk2
	make
}

package() {
	cd "${srcdir}/geh"
	make install
	mkdir -p "$pkgdir/usr/bin"
	mv "$pkgdir/bin/"* "$pkgdir/usr/bin"
	rmdir "$pkgdir/bin"
}

# vim: ft=PKGBUILD
