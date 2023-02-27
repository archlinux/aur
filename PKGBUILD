# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=authselect
pkgver=1.4.2
pkgrel=1
pkgdesc="Authselect is a tool to select system authentication and identity sources from a list of supported profiles."
arch=('i686' 'x86_64')
url="https://github.com/authselect/authselect"
license=('GPL3')
depends=('popt' 'asciidoc' 'libselinux')
provides=('authconfig')
conflicts=('authconfig')
makedepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('5aecf90f78fbb996db77a9f5026256213d9cb2024ab6f15d19f88053b25b37ad')

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
