# Maintainer: Jens Kuske <jenskuske@gmail.com>
# Contributor: smotocel69 <smotocel69@gmail.com>
pkgname=libvdpau-sunxi-git
pkgver=0.3.r0.b3d2eb4
pkgrel=1
pkgdesc="VDPAU driver for Allwinner sunxi SoCs"
arch=('armv7h')
url="https://github.com/linux-sunxi/libvdpau-sunxi"
license=('LGPL')
depends=('libx11')
makedepends=('git' 'libvdpau')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/linux-sunxi/${pkgname%-git}")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --tags --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
