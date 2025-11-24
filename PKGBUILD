# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Julien Savard <juju@juju2143.ca>
pkgname=x16-rom-git
pkgver=r49.r2.gcae4a59a
pkgrel=1
pkgdesc="ROM files for The 8-Bit Guy's Commander X16"
arch=('any')
url="http://commanderx16.com/"
license=('unknown')
groups=('commander-x16')
depends=()
makedepends=('git' 'cc65' 'lzsa')
optdepends=('x16-emulator-git: emulator for the ROMs')
provides=('x16-rom')
conflicts=('x16-rom')
replaces=()
options=(!debug)
install=x16-rom.install
changelog=
source=("git+https://github.com/X16Community/x16-rom.git")
sha256sums=('SKIP')

pkgver() {
        cd "${pkgname%-git}"
        git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${pkgname%-git}"
	_pkgver1=${pkgver#r}
	make PRERELEASE_VERSION=${_pkgver1%%[^0-9]*} -j1
}

package() {
	cd "${pkgname%-git}"
	install -Dm644 build/x16/rom.bin "$pkgdir/usr/share/${pkgname%-git}/rom.bin"
	install -Dm644 build/x16/rom_labels.h "$pkgdir/usr/include/x16/rom_labels.h"
}

