# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=authselect
pkgver=1.8.0
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
sha256sums=('2219a37cb3cd9ab5ae271c7a03c5dc0d2458ffb922f67def5b89a3a065662697')

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
