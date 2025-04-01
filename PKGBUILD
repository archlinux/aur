# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=esp-idf
pkgver=5.4.1
pkgrel=1
pkgdesc="Espressif IoT Development Framework. Official development framework for ESP32."
arch=('i686' 'x86_64' 'aarch' 'aarch64' 'armv7h')
url="https://github.com/espressif/esp-idf"
license=('Apache-2.0')
depends=('ccache' 'cmake' 'dfu-util' 'git' 'gperf' 'libusb' 'ninja' 'python')
makedepends=('unzip')
options=('!strip')
install='esp-idf.install'
source=(https://github.com/espressif/${pkgname}/releases/download/v${pkgver}/${pkgname}-v${pkgver}.zip)
noextract=(${pkgname}-v${pkgver}.zip)
sha256sums=('6b6b9e7b5e1d6b946e6cfd062a3ce1cc8bb5957befdda683c2a0d9cb16a45015')

prepare() {
	unzip -o ${pkgname}-v${pkgver}.zip
}

build() {
	cd "$srcdir/${pkgname}"
	git submodule update --init
}

package() {
	cd "${srcdir}/${pkgname}"
	mkdir -p ${pkgdir}/opt/esp-idf
	cp -R . ${pkgdir}/opt/esp-idf
}
