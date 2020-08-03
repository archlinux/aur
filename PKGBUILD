# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=goverlay-git
pkgver=0.3.7.r0.g739f588
pkgrel=1
pkgdesc="A GUI to help manage Vulkan/OpenGL overlays"
arch=('x86_64')
url="https://github.com/benjamimgois/goverlay"
license=('GPL3')
depends=('gtk2')
makedepends=('git' 'lazarus')
checkdepends=('appstream')
optdepends=('mangohud: Configure MangoHUD'
            'vkbasalt: Configure vkBasalt'
            'mesa-demos: OpenGL preview'
            'vulkan-tools: Vulkan preview')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/benjamimgois/goverlay.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make LAZBUILDOPTS=--lazarusdir=/usr/lib/lazarus
}

check() {
	cd "$srcdir/${pkgname%-git}"
	make tests
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make prefix=/usr DESTDIR="$pkgdir/" install
}
