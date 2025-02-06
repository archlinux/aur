# Maintainer: William Edwards <shadowapex@gmail.com>
pkgname=inputplumber-git
_pkgbase=inputplumber
pkgver=v0.44.0.r0.gbb60da0
pkgrel=1
pkgdesc="Open source input router and remapper daemon for Linux"
arch=('x86_64')
url="https://github.com/ShadowBlip/InputPlumber"
license=('GPL')
depends=('dbus' 'libevdev' 'libiio')
makedepends=('rust' 'make' 'cmake' 'clang' 'git')
provides=('inputplumber')
conflicts=('inputplumber-bin')
source=("${_pkgbase}::git+https://github.com/ShadowBlip/${_pkgbase}.git")
options=(!lto)

sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgbase}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/${_pkgbase}"
}

build() {
	cd "$srcdir/${_pkgbase}"
	make build
}

package() {
	cd "$srcdir/${_pkgbase}"
	make install PREFIX=${pkgdir}/usr NO_RELOAD=true
}
