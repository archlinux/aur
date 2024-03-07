# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=beakerlib
pkgver=1.30
pkgrel=1
pkgdesc="Shell-level integration testing library, providing convenience functions which simplify writing, running and analysis of integration and blackbox tests."
arch=('i686' 'x86_64')
url="https://github.com/beakerlib/beakerlib"
license=('GPL2')
depends=()
makedepends=('perl')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/beakerlib/beakerlib/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('bd06fc61b32d9caf4324587706a8363e37e771355da8297d0c5ba0023ae31098')

_srcdir="${pkgname}-${pkgver}"

prepare() {
	cd "${_srcdir}"
	sed -i 's/install: build/install:/' 'Makefile' 'src/Makefile'
}

build() {
	cd "${_srcdir}"
	make build
}

package() {
	cd "${_srcdir}"
	make DESTDIR="${pkgdir}/usr" install
	
	mkdir -p "${pkgdir}/usr/lib/tmpfiles.d"
	install -m0644 "dist/${pkgname}-tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
