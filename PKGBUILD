# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=esp-idf
pkgver=5.4.1
pkgrel=2
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
sha256sums=('d78e49aafe46e35d34bc8804b64f23cd0a6cabdfe221876ba59f68b4534f0839')

prepare() {
	unzip -o ${pkgname}-v${pkgver}.zip
}

build() {
	cd "$srcdir/${pkgname}-v${pkgver}"
	git submodule update --init
}

package() {
	cd "${srcdir}/${pkgname}-v${pkgver}"
	mkdir -p ${pkgdir}/opt/esp-idf
	cp -R . ${pkgdir}/opt/esp-idf
}
