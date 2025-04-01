# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
_pkgname=esp-idf
pkgname=${_pkgname}-git
pkgver=5.5.dev.r2752.a3864c088d
pkgrel=1
pkgdesc='Espressif IoT Development Framework. Official development framework for ESP32.'
arch=('i686' 'x86_64' 'aarch' 'aarch64' 'armv7h')
url="https://github.com/espressif/esp-idf"
license=('Apache-2.0')
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
	cd "${srcdir}/${_pkgname}"
	mkdir -p ${pkgdir}/opt/esp-idf
	cp -R . ${pkgdir}/opt/esp-idf
}
