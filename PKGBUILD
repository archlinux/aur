# Maintainer: Kunibert Ritter <coon@mailbox.org>
pkgname=esp-idf4
_pkgname=${pkgname::-1}
pkgver=4.4.7
pkgrel=1
pkgdesc="Espressif IoT Development Framework. Official development framework for ESP32."
arch=('i686' 'x86_64' 'aarch' 'aarch64' 'armv7h')
url="https://github.com/espressif/esp-idf"
license=('APACHE')
depends=('ccache' 'cmake' 'dfu-util' 'git' 'gperf' 'libusb' 'ninja' 'python')
makedepends=('unzip')
options=('!strip')
install='esp-idf.install'
provides=('esp-idf')
source=(https://github.com/espressif/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}.zip)
noextract=(${pkgname}-v${pkgver}.zip)
sha256sums=('eee10d234da78cc47a7c84747222e26ba77d4f8fbc9dd80a40e6a5d3297f393e')

prepare() {
	unzip -o ${_pkgname}-v${pkgver}.zip
}

build() {
	cd "$srcdir/${_pkgname}-v${pkgver}"
	git submodule update --init
}

package() {
	mkdir -p ${pkgdir}/opt/esp-idf
	cd "${srcdir}/${_pkgname}-v${pkgver}"
	cp -R . ${pkgdir}/opt/esp-idf
}
