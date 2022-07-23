# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=goverlay
pkgver=0.9.0
_pkgver=0.9
pkgrel=1
pkgdesc="A GUI to help manage Vulkan/OpenGL overlays"
arch=('x86_64')
url="https://github.com/benjamimgois/goverlay"
license=('GPL3')
depends=('qt5pas' 'qt5-base' 'mangohud')
makedepends=('git' 'lazarus')
checkdepends=('appstream' 'desktop-file-utils')
optdepends=('vkbasalt: Configure vkBasalt'
            'mesa-utils: OpenGL preview'
            'vulkan-tools: Vulkan preview'
            'git: Clone reshade repository'
            'replay-sorcery: Instant replay solution'
	    'breeze: Prefered choice for theme'
	    'oxygen: Backup choice for theme')
conflicts=("${pkgname%-git}" "${pkgname%-bin}")
source=("${url}/archive/refs/tags/${_pkgver}.tar.gz")
sha512sums=('570e79dea9c1b0ee965719741c1dd404ac3b87c4c3e5cecc242f0bb3ffe6158bcbb57601ed1b1318c946631a19455dea1efbf692c2e2c46e829be27dc0032aed')

build() {
	cd "$srcdir/$pkgname-$_pkgver"
	make LAZBUILDOPTS=--lazarusdir=/usr/lib/lazarus
}

check() {
	cd "$srcdir/$pkgname-$_pkgver"
	make tests
}

package() {
	cd "$srcdir/$pkgname-$_pkgver"
	make prefix=/usr libexecdir=/lib DESTDIR="$pkgdir/" install
}
