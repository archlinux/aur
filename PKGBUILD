# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=esp-idf
pkgver=4.3
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
sha512sums=('8580fbda9208bf4fb807c5f7e5c04621985ca7894cd56862928b68dedf097dca5bacc9d8a104f5b3dccd52a82c54997284350b960ab476122b7fae4397cd9961')

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
