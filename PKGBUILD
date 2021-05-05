# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=esp-idf
pkgver=4.2.1
pkgrel=1
pkgdesc="Espressif IoT Development Framework. Official development framework for ESP32."
arch=('i686' 'x86_64' 'aarch' 'aarch64' 'armv7h')
url="https://github.com/espressif/esp-idf"
license=('APACHE')
depends=('python' 'python-click' 'python-pyserial' 'python-future' 'python-cryptography' 'python-pyparsing' 'python-pyelftools')
makedepends=('git' 'unzip')
install='esp-idf.install'
source=(https://github.com/espressif/${pkgname}/releases/download/v${pkgver}/${pkgname}-v${pkgver}.zip)
noextract=(${pkgname}-v${pkgver}.zip)
sha512sums=('a13f9b9e0f3f99b7129c14880f77e4357969a6f888e7ca2891875b7551ae184f5e797ee6c89f49448aca5c5b02dd1217ad1ab2986ee1e3fa34c7131d1a0b64e7')

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
