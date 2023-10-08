# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
_pkgname=esp-idf
pkgname=${_pkgname}-git
pkgver=5.2.dev.r3213.4e04c00d1c
pkgrel=1
pkgdesc='Espressif IoT Development Framework. Official development framework for ESP32.'
arch=('i686' 'x86_64' 'aarch' 'aarch64' 'armv7h')
url="https://github.com/espressif/esp-idf"
license=('Apache')
depends=('ccache' 'cmake' 'dfu-util' 'git' 'gperf' 'libusb' 'ninja' 'python')
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
	git submodule init
	./tools/set-submodules-to-github.sh
	git submodule update --recursive
}

package() {
	mkdir -p ${pkgdir}/opt/esp-idf
	cd "${srcdir}/${_pkgname}"
	cp -R . ${pkgdir}/opt/esp-idf
}
