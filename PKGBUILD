# Mantainer: amirva < amirv at github >
# Mantainer: sgar < swhaat at github >
pkgbase="esphomeyaml-dev"
pkgname="esphome-dev"
_pkgname="esphome"
pkgver=2022.6.1.r29.g28d2949eb
pkgrel=1
pkgdesc="Solution for your ESP8266/ESP32 projects with Home Assistant (development branch)"
url="https://github.com/esphome/ESPHome"
depends=('python-setuptools'
	'python-voluptuous'
	'python-yaml'
	'python-paho-mqtt'
	'python-colorlog'
	'python-tornado'
	'python-protobuf'
	'python-tzlocal'
	'python-pyserial'
	'python-ifaddr'
	'python-pyaes'
	'python-ecdsa'
	'platformio'
	'esptool'
	'python-aioesphomeapi')
conflicts=('esphome')
provides=('esphome')
optdepends=('python-esphome-dashboard: esphome dashboard addition')
license=('MIT')
arch=('any')
replaces=('esphomeyaml')
source=("esphome::git+https://github.com/esphome/ESPHome#branch=dev")
sha256sums=('SKIP')

pkgver() {
	  cd "$srcdir/$_pkgname"
		  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/$_pkgname"
	sed -i 's/==.*//' requirements.txt
}

build() {
    cd "$srcdir/$_pkgname"
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
