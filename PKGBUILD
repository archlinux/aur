# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=goverlay
pkgver=0.6.3
pkgrel=1
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
sha512sums=('861a635446882e2e74c66210e0e49bc5e672c59a5953fbe3415521822e4aefea68654f384d5774970d0b70272f09fc95eda15a5ec766ca48bf0618735efca3e2')

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
