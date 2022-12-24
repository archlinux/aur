# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
_pkgname=esp-idf
pkgname=${_pkgname}-git
pkgver=5.1.dev.r2509.cfef24863f
pkgrel=1
pkgdesc='Espressif IoT Development Framework. Official development framework for ESP32.'
arch=('i686' 'x86_64' 'aarch' 'aarch64' 'armv7h')
url="https://github.com/espressif/esp-idf"
license=('Apache')
depends=('cmake' 'git' 'libusb' 'python' 'python-click' 'python-cryptography' 'python-future' 'python-pyelftools' 'python-pyparsing' 'python-pyserial' 'python-virtualenv')
provides=(${_pkgname})
conflicts=(${_pkgname})
options=('!strip')
install='esp-idf-git.install'
source=('git+https://github.com/espressif/esp-idf.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}"
	git describe | sed 's/\([^-]*-\)g/r\1/;s/-/./g' | sed 's/^v//'
}

prepare() {
	cd $srcdir/${_pkgname}
	git submodule update --init
}

package() {
	mkdir -p ${pkgdir}/opt/esp-idf
	cd "${srcdir}/${_pkgname}"
	cp -R . ${pkgdir}/opt/esp-idf
}
