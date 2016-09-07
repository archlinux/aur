# Maintainer: Ben Wolsieffer <benwolsieffer at gmail dot com>
pkgname=qdriverstation
_pkgver=16.08
pkgver=16.08
pkgrel=1
pkgdesc="Open source clone of the FRC Driver Station"
arch=('i686' 'x86_64')
url="https://github.com/FRC-Utilities/QDriverStation"
license=('MIT')
groups=()
depends=('sdl2' 'qt5-declarative' 'qt5-multimedia' 'qt5-quickcontrols')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
source=("https://github.com/FRC-Utilities/QDriverStation/archive/v${_pkgver}.tar.gz")
noextract=()
md5sums=('558474c67d8a270aad7c9a8681ed3401')

extractdir="QDriverStation-${_pkgver}"

prepare() {
	cd "$srcdir/${extractdir}"
}

build() {
	cd "$srcdir/${extractdir}"
	qmake-qt5
	make
}

check() {
	cd "$srcdir/${extractdir}"
	make -k check
}

package() {
	cd "$srcdir/${extractdir}"
	make INSTALL_ROOT="$pkgdir/" install

	# Install MIT license
	install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
