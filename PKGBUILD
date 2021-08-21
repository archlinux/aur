# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=goverlay
pkgver=0.6.2
pkgrel=2
pkgdesc="A GUI to help manage Vulkan/OpenGL overlays"
arch=('x86_64')
url="https://github.com/benjamimgois/goverlay"
license=('GPL3')
depends=('qt5pas' 'qt5-base' 'mangohud')
makedepends=('git' 'lazarus' 'qt5-base')
checkdepends=('appstream' 'desktop-file-utils')
optdepends=('vkbasalt: Configure vkBasalt'
            'mesa-demos: OpenGL preview'
            'vulkan-tools: Vulkan preview'
            'git: Clone reshade repository'
            'replay-sorcery: Instant replay solution')
conflicts=("${pkgname%-git}" "${pkgname%-bin}")
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('1f22dbf534b1a8c178d4497da2cd9bfb5d7c84948c1cfed539b67139ca96592d333960923910a6b14aa49fd27f4981dec695f335a08dfcce6e612b37a2553540')

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
