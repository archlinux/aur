# Maintainer: Ben Wolsieffer <benwolsieffer@gmail.com>
pkgname=qdriverstation
pkgver=17.01.1
pkgrel=1
pkgdesc="Open source clone of the FRC Driver Station"
arch=('i686' 'x86_64')
url="https://github.com/FRC-Utilities/QDriverStation"
license=('MIT')
groups=()
depends=('sdl2' 'qt5-multimedia' 'qt5-quickcontrols')
makedepends=('git')
provides=("${pkgname}")
conflicts=("${pkgname-git}")
replaces=()
backup=()
options=()
source=("https://github.com/FRC-Utilities/QDriverStation/archive/v${pkgver}.tar.gz")
noextract=()
md5sums=('07a9c12cb95e8fa7639ee464f768cb40')

_extractdir="QDriverStation-${pkgver}"

prepare() {
	cd "$srcdir/${_extractdir}"
}

build() {
	cd "$srcdir/${_extractdir}"
	qmake-qt5
	make
}

check() {
	cd "$srcdir/${_extractdir}"
	make -k check
}

package() {
	cd "$srcdir/${_extractdir}"
	make INSTALL_ROOT="$pkgdir/" install

	# Install MIT license
	install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
