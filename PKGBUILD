# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=authselect
pkgver=1.6.1
pkgrel=1
pkgdesc="Tool to select system authentication and identity sources from a list of supported profiles."
arch=('i686' 'x86_64')
url="https://github.com/authselect/authselect"
license=('GPL-3.0-only')
depends=('popt' 'asciidoc' 'libselinux')
provides=('authconfig')
conflicts=('authconfig')
makedepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('514eff30f1e2dcfde979b56a1d9700a09f1dfd9e90a2518a995726d86657495e')

_srcdir="${pkgname}-${pkgver}"

prepare() {
	cd "${_srcdir}"
	autoreconf -i
}

build() {
	cd "${_srcdir}"
	./configure --prefix=/usr --localstatedir=/var --sbindir=/usr/bin --sysconfdir=/etc
	make
}

package() {
	cd "${_srcdir}"
	make DESTDIR="${pkgdir}" install
	install -Dpm644 'COPYING' -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
