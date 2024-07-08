# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=beakerlib
pkgver=1.31.1
pkgrel=1
pkgdesc="Shell-level integration testing library, providing convenience functions which simplify writing, running and analysis of integration and blackbox tests."
arch=('i686' 'x86_64')
url="https://github.com/beakerlib/beakerlib"
license=('GPL2')
depends=('perl')
makedepends=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('5557f0226311d2cf234a4f5cd3edbf99f1e88c7f10210c5c0c17b43c220b6c81')

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
	depends+=('util-linux' 'python')

	cd "${_srcdir}"
	make DESTDIR="${pkgdir}/usr" install

	mkdir -p "${pkgdir}/usr/lib/tmpfiles.d"
	install -m0644 "dist/${pkgname}-tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
