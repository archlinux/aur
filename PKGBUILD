# Maintainer: William Edwards <shadowapex@gmail.com>
pkgname=powerstation-git
_pkgbase=powerstation
pkgver=v0.2.2.r0.g2b2c007
pkgrel=2
pkgdesc="Open source performance daemon with DBus interface"
arch=('x86_64')
url="https://github.com/ShadowBlip/PowerStation"
license=('GPL')
depends=('dbus' 'pciutils')
makedepends=('rust' 'make' 'cmake' 'clang' 'git')
provides=('powerstation')
conflicts=('powerstation-bin')
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
