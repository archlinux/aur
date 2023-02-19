# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=esp-idf
pkgver=5.0.1
pkgrel=1
pkgdesc="Espressif IoT Development Framework. Official development framework for ESP32."
arch=('i686' 'x86_64' 'aarch' 'aarch64' 'armv7h')
url="https://github.com/espressif/esp-idf"
license=('APACHE')
depends=('cmake' 'git' 'libusb' 'python' 'python-click' 'python-cryptography' 'python-future' 'python-pyelftools' 'python-pyparsing' 'python-pyserial' 'python-virtualenv')
makedepends=('unzip')
options=('!strip')
install='esp-idf.install'
source=(https://github.com/espressif/${pkgname}/releases/download/v${pkgver}/${pkgname}-v${pkgver}.zip)
noextract=(${pkgname}-v${pkgver}.zip)
sha256sums=('a0b0a1743c9d7a5edbd7c94474e72ac42841aa3e5f1a946f43898e1f6d7c4d37')

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
