# Maintainer: w0rty <mawo97 at gmail.com>
# old maintainer: Dominik Heidler <dominik@heidler.eu>
pkgname=rtl_433-git
pkgver=r2934.20aa5484
pkgrel=1
pkgdesc="Turns your Realtek RTL2832 based DVB dongle into a 433.92MHz generic data receiver"
arch=('i686' 'x86_64' 'armv7h' 'aarch64' 'armv6h')
license=('GPL')
depends=('rtl-sdr' 'openssl')
makedepends=('git' 'gcc' 'cmake')
optdepends=()
provides=('rtl_433')
conflicts=('rtl_433')
url="https://github.com/merbanan/rtl_433"
source=('git+https://github.com/merbanan/rtl_433.git')
md5sums=('SKIP')

_gitname=rtl_433

pkgver() {
	cd "${_gitname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${_gitname}"
	mkdir -p build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	cd "${_gitname}/build"
	make DESTDIR=${pkgdir} install
}
