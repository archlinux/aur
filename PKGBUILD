# Maintainer: Ben Wolsieffer <benwolsieffer at gmail dot com>
pkgname=qdriverstation
_pkgver=16.06.1
pkgver=16.06.1
pkgrel=1
pkgdesc="Open source clone of the FRC Driver Station"
arch=('i686' 'x86_64')
url="https://github.com/wint-3794/qdriverstation"
license=('MIT')
groups=()
depends=('sdl2' 'qt5-declarative')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
source=("https://github.com/WinT-3794/QDriverStation/archive/v${_pkgver}.tar.gz")
noextract=()
md5sums=('760f07e5b435f560a1b791465c9a3090')

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
