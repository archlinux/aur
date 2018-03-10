# Maintainer: Laurens Hazewinkel <laurens dot hazewinkel at gmail dot com>
pkgname=mod-host-git
pkgver=0.10.6.r270.g1726ad0
pkgrel=1
pkgdesc="LV2 host for Jack controllable via socket or command line"
arch=('x86_64')
url="https://github.com/moddevices/mod-host"
license=('GPL3')
depends=('lilv>=0.14.2' 'fftw')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/moddevices/${pkgname%-git}")
md5sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${pkgname%-git}"
	make
}

package() {
	cd "${pkgname%-git}"
	make PREFIX="/usr" DESTDIR="$pkgdir/" install
}
