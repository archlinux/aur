# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=goverlay
pkgver=0.6.4
pkgrel=2
pkgdesc="A GUI to help manage Vulkan/OpenGL overlays"
arch=('x86_64')
url="https://github.com/benjamimgois/goverlay"
license=('GPL3')
depends=('qt5pas' 'qt5-base' 'mangohud')
makedepends=('git' 'lazarus' 'qt5-base')
checkdepends=('appstream' 'desktop-file-utils')
optdepends=('vkbasalt: Configure vkBasalt'
            'mesa-utils: OpenGL preview'
            'vulkan-tools: Vulkan preview'
            'git: Clone reshade repository'
            'replay-sorcery: Instant replay solution')
conflicts=("${pkgname%-git}" "${pkgname%-bin}")
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('869ff06ea11890a65b45cf98b4a9c462373aba63532757c2084f18992d3b86f3c8e88d6e4a8d7d9af650a7ebaa0fd5d33d27878c0b1d545982368da115d17d0d')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make LAZBUILDOPTS=--lazarusdir=/usr/lib/lazarus
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	make tests
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make prefix=/usr DESTDIR="$pkgdir/" install
}
