# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=beakerlib
pkgver=1.33.2
pkgrel=1
pkgdesc="Shell-level integration testing library, providing convenience functions which simplify writing, running and analysis of integration and blackbox tests."
arch=('any')
url="https://github.com/beakerlib/beakerlib"
license=('GPL-2.0-only')
depends=('perl')
makedepends=()
optdepends=('python-six' 'python-lxml')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('e13f4df8ad055c05bcca2226d92e298156eb9ea6de81415c844e567e4e7ab117')

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
