# Maintainer: nytpu <alex at nytpu dot com>

_progname=gpod-utils
pkgname=gpod-utils-git
pkgver=v1.3.1.r11.g499e8da
pkgrel=1
pkgdesc="Command line tools using libgpod to access iPod data."
url='https://github.com/whatdoineed2do/gpod-utils'
arch=('x86_64')
license=('unknown')
depends=('libgpod' 'json-c' 'glib2' 'sqlite' 'ffmpeg')
makedepends=('git')
source=('git+https://github.com/whatdoineed2do/gpod-utils.git')
sha256sums=('SKIP')
provides=("${_progname}")

pkgver() {
	cd "${srcdir}/${_progname}"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${_progname}"
	./config.sh
	./configure
}

build() {
	cd "${srcdir}/${_progname}"
	make
}

package() {
	cd "${srcdir}/${_progname}"
	make DESTDIR="${pkgdir}" prefix="/usr" install
}
