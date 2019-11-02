# Mantainer: sgar < swhaat at github >

pkgbase=esphomeyaml
pkgname=esphome
pkgver=1.14.0
pkgrel=1
pkgdesc="Solution for your ESP8266/ESP32 projects with Home Assistant"
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
	'esptool')
license=('MIT')
arch=('any')
replaces=('esphomeyaml')
source=("https://github.com/esphome/ESPHome/archive/v${pkgver}.tar.gz")
sha256sums=('e50a4880b6e2a4c37e9abe3156f0f4c12aa16b1a37a05f2bc7868329bb450114')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

check() {
    cd "$srcdir/${pkgname}-${pkgver}"

##	 Run tests, takes a while
    cp ${pkgname}/__main__.py ${pkgname}.py
    python esphome.py tests/test1.yaml compile
#    python esphome.py tests/test2.yaml compile
}

