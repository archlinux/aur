# Maintainer: Josef Miegl <josef@miegl.cz>

pkgname=osmo-sgsn-git
_pkgname=osmo-sgsn
provides=("${_pkgname}")
conflicts=("${_pkgname}")
pkgver=1.4.0
pkgrel=1
pkgdesc="OsmoSGSN is an Open Source implementation of a SGSN (Serving GPRS Support Node)."
url="https://osmocom.org/projects/osmosgsn"
arch=('any')
license=(GPL)
depends=('libosmocore' 'osmo-ggsn' 'osmo-iuh' 'libasn1c' 'c-ares')
source=("git://git.osmocom.org/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  echo $(git describe --always | sed 's/-/./g')
}

build() {
	cd "${srcdir}/${_pkgname}"
	autoreconf -i
	./configure --prefix=/usr --enable-iu
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	make DESTDIR=${pkgdir} install
}
