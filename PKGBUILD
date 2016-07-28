# Maintainer: Ben Wolsieffer <benwolsieffer at gmail dot com>
pkgname=qdriverstation
_pkgver=16.07
pkgver=16.07
pkgrel=1
pkgdesc="Open source clone of the FRC Driver Station"
arch=('i686' 'x86_64')
url="https://github.com/FRC-Utilities/QDriverStation"
license=('MIT')
groups=()
depends=('sdl2' 'qt5-declarative')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
source=("https://github.com/FRC-Utilities/QDriverStation/archive/v${_pkgver}.tar.gz")
noextract=()
md5sums=('ef868c86be6b73133ee9c7cdef1ff424')

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
