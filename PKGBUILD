# Maintainer: Josef Miegl <josef@miegl.cz>

pkgname=osmo-sip-connector-git
_pkgname=osmo-sip-connector
provides=("${_pkgname}")
conflicts=("${_pkgname}")
pkgver=1.2.0
pkgrel=1
pkgdesc="This is the modern gateway between the MNCC Interface of OsmoMSC and OsmoNITB and an external SIP trunk."
url="https://osmocom.org/projects/osmo-sip-conector"
arch=('any')
license=(GPL)
depends=('libosmocore' 'libosmo-abis' 'osmo-msc' 'sofia-sip-bc')
source=("git://git.osmocom.org/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
	cd $_pkgname
	echo $(git describe --always | sed 's/-/./g')
}

build() {
	cd "${srcdir}/${_pkgname}"
	autoreconf -i
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	make DESTDIR=${pkgdir} install
}
