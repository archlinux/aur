# Maintainer: Ben Wolsieffer <benwolsieffer@gmail.com>
pkgname=qdriverstation
pkgver=18.01
pkgrel=1
pkgdesc="Open source clone of the FRC Driver Station"
arch=('i686' 'x86_64')
url="https://github.com/FRC-Utilities/QDriverStation"
license=('MIT')
depends=('sdl2' 'qt5-multimedia' 'qt5-quickcontrols')
makedepends=('git')
provides=("${pkgname}")
conflicts=("${pkgname-git}")
source=("https://github.com/FRC-Utilities/QDriverStation/archive/${pkgver}.tar.gz")
sha256sums=('8ac8e1d3f3517c33a86ccaedb584fbc5aa222c9ada5c072cf9d1e02ad6ff32fb')

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
