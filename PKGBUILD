# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=goverlay
pkgver=0.6.1
pkgrel=1
pkgdesc="A GUI to help manage Vulkan/OpenGL overlays"
arch=('x86_64')
url="https://github.com/benjamimgois/goverlay"
license=('GPL3')
depends=('qt5pas' 'qt5-base')
makedepends=('git' 'lazarus' 'qt5-base')
checkdepends=('appstream' 'desktop-file-utils')
optdepends=('mangohud: Configure MangoHUD'
            'vkbasalt: Configure vkBasalt'
            'mesa-demos: OpenGL preview'
            'vulkan-tools: Vulkan preview'
            'git: Clone reshade repository'
            'replay-sorcery: Instant replay solution')
conflicts=("${pkgname%-git}" "${pkgname%-bin}")
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('f162dccd9054eaaaeea61f91501f6cadd31f9fd30fd869e39ac9c4068db9118e46d371e310bf27861ce10f42e864194389acb6b568514c0c3188481aa0d5fba9')

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
