# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=esp-idf
pkgver=5.2
pkgrel=1
pkgdesc="Espressif IoT Development Framework. Official development framework for ESP32."
arch=('i686' 'x86_64' 'aarch' 'aarch64' 'armv7h')
url="https://github.com/espressif/esp-idf"
license=('APACHE')
depends=('ccache' 'cmake' 'dfu-util' 'git' 'gperf' 'libusb' 'ninja' 'python')
makedepends=('unzip')
options=('!strip')
install='esp-idf.install'
source=(https://github.com/espressif/${pkgname}/releases/download/v${pkgver}/${pkgname}-v${pkgver}.zip)
noextract=(${pkgname}-v${pkgver}.zip)
sha256sums=('8170f842ad42cad78d7b99f1eb2dbc4bf21cc96d153d2dfc62021b4f4c566903')

prepare() {
	unzip -o ${pkgname}-v${pkgver}.zip
}

build() {
	cd "$srcdir/${pkgname}-v${pkgver}"
	git submodule update --init
}

package() {
	mkdir -p ${pkgdir}/opt/esp-idf
	cd "${srcdir}/${pkgname}-v${pkgver}"
	cp -R . ${pkgdir}/opt/esp-idf
}
