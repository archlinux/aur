# Maintainer: Ben Wolsieffer <benwolsieffer@gmail.com>
pkgname=qdriverstation-git
pkgver=r1186.9271a70
pkgrel=1
pkgdesc="Open source clone of the FRC Driver Station"
arch=('i686' 'x86_64')
url="https://github.com/FRC-Utilities/qdriverstation"
license=('MIT')
groups=()
depends=('sdl2' 'qt5-multimedia' 'qt5-quickcontrols')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
source=('qdriverstation::git+https://github.com/FRC-Utilities/QDriverStation.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	git submodule update --init
}

build() {
	cd "$srcdir/${pkgname%-git}"
	qmake-qt5
	make
}

check() {
	cd "$srcdir/${pkgname%-git}"
	make -k check
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make INSTALL_ROOT="$pkgdir/" install

	# Install MIT license
	install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
