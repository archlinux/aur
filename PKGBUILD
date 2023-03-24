# Maintainer: @RubenKelevra <cyrond@gmail.com>

pkgname='python-platformio'
_module=${pkgname#python-}
pkgver='6.1.6'
pkgrel=1
pkgdesc="A professional collaborative platform for embedded development. Cross-platform IDE and Unified Debugger. Static Code Analyzer and Remote Unit Testing. Multi-platform and Multi-architecture Build System. Firmware File Explorer and Memory Inspection."
# IoT, Arduino, CMSIS, ESP-IDF, FreeRTOS, libOpenCM3, mbedOS, Pulp OS, SPL, STM32Cube, Zephyr RTOS, ARM, AVR, Espressif (ESP8266/ESP32), FPGA, MCS-51 (8051), MSP430, Nordic (nRF51/nRF52), NXP i.MX RT, PIC32, RISC-V, STMicroelectronics (STM8/STM32), Teensy
url="https://platformio.org"
depends=(
	'python'
	'python-bottle>=0.12'
	'python-click>=8.0.4'
	'python-colorama'
	'python-marshmallow>=3'
	'python-pyelftools>=0.27'
	'python-pyserial>=3.5'
	'python-requests>=2'
	'python-semantic-version>=2.10'
	'python-tabulate>=0.9'
	'python-aiofiles>=22.1'
	'python-ajsonrpc>=1'
	'python-starlette>=0.23'
	'uvicorn>=0.20'
	'python-wsproto>=1.2'
)
makedepends=('python-setuptools')
license=('Apache')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
b2sums=('d8163775942cd780f8d2eb6d5c1109bb4771669d41e915772c4b1c14d9773ee5e17b9b03b8791328f63d6b1af1a0cca15dba3b5e7fef3eceb180073dd4437266')

build() {
	cd "${srcdir}/${_module}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_module}-${pkgver}"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/python-platformio/LICENSE"
	python setup.py install --root="${pkgdir}" --optimize=2 --skip-build
}
