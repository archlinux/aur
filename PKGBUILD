# Maintainer: jujudusud <jujudusud at gmail dot com>
# Contributor: Laurens Hazewinkel <laurens dot hazewinkel at gmail dot com>
pkgname=mod-host-git
pkgver=0.10.6.r502.g44aece1
pkgrel=2
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
