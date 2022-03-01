# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=goverlay
pkgver=0.8
_pkgver=0.8
pkgrel=1
pkgdesc="A GUI to help manage Vulkan/OpenGL overlays"
arch=('x86_64')
url="https://github.com/benjamimgois/goverlay"
license=('GPL3')
depends=('qt5pas' 'qt5-base' 'mangohud' 'breeze')
makedepends=('git' 'lazarus')
checkdepends=('appstream' 'desktop-file-utils')
optdepends=('vkbasalt: Configure vkBasalt'
            'mesa-utils: OpenGL preview'
            'vulkan-tools: Vulkan preview'
            'git: Clone reshade repository'
            'replay-sorcery: Instant replay solution')
conflicts=("${pkgname%-git}" "${pkgname%-bin}")
source=("${url}/archive/refs/tags/${_pkgver}.tar.gz")
sha512sums=('1aa3bda3d566693095e125dd91a9fc6fdbedc6795d31eaca1c93ef7ee9e0907142d62f4556c78ebd2d46e57a819502725918473d06ec5c5b7a727d1cfb425dae')

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
