# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=esp-idf
pkgver=4.3.1
pkgrel=1
pkgdesc="Espressif IoT Development Framework. Official development framework for ESP32."
arch=('i686' 'x86_64' 'aarch' 'aarch64' 'armv7h')
url="https://github.com/espressif/esp-idf"
license=('APACHE')
depends=('cmake' 'git' 'libusb' 'python' 'python-click' 'python-cryptography' 'python-future' 'python-pyelftools' 'python-pyparsing' 'python-pyserial' 'python-virtualenv')
makedepends=('unzip')
install='esp-idf.install'
source=(https://github.com/espressif/${pkgname}/releases/download/v${pkgver}/${pkgname}-v${pkgver}.zip)
noextract=(${pkgname}-v${pkgver}.zip)
sha512sums=('56d406a64905513cb93624f39d3c68032257220abe5f34fe88aa25e035be547ef8a6a290b61a0c86aa04f690077f1d4bda2ea1563c3cb672ed15ef15abf9b98b')

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
