# Maintainer: Josef Miegl <josef@miegl.cz>

pkgname=osmo-mgw-git
_pkgname=osmo-mgw
provides=("${_pkgname}")
conflicts=("${_pkgname}")
pkgver=1.5.0.1.g622dd617
pkgrel=1
pkgdesc="Osmocom Media Gateway, to manage, connect and optionally transcode voice streams between different network elements such as BTSs and external entities like SIP."
url="https://osmocom.org/projects/osmo-mgw/"
arch=('any')
license=(GPL)
depends=('libosmocore' 'libosmo-abis' 'libosmo-netif')
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
