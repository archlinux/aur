# Mantainer: sgar < swhaat at github >

pkgbase=esphomeyaml-dev
pkgname=esphome-dev
pkgver=dev
pkgrel=1
pkgdesc="Solution for your ESP8266/ESP32 projects with Home Assistant - development branch"
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
optdepends=('python-esphome-dashboard: esphome dashboard addition')
license=('MIT')
arch=('any')
replaces=('esphomeyaml')
source=("${pkgname}::git+https://github.com/esphome/ESPHome#branch=dev")
sha256sums=('SKIP')

prepare() {
    cd "$srcdir/${pkgname}"
	sed -i 's/==.*//' requirements.txt
}

build() {
    cd "$srcdir/${pkgname}"
    python setup.py build
}

package() {
    cd "$srcdir/${pkgname}"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

check() {
    cd "$srcdir/${pkgname}"

##	 Run tests, takes a while
    cp esphome/__main__.py ${pkgname}.py
#    python esphome.py tests/test1.yaml compile
#    python esphome.py tests/test2.yaml compile
}

