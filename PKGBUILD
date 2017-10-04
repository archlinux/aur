# Maintainer: Gaetan Bisson <bisson@archlinux.org
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: Daenyth <Daenyth+Arch [at] gmail [dot] com>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: ice-man <icemanf@gmail.com>

pkgname=aircrack-ng-svn
_pkgname=aircrack-ng
pkgver=20170911.2917
pkgrel=1
pkgdesc='Key cracker for the 802.11 WEP and WPA-PSK protocols'
url='http://www.aircrack-ng.org/'
arch=('i686' 'x86_64' 'armv7h')
license=('GPL2')
makedepends=('subversion')
depends=('openssl' 'sqlite' 'iw' 'net-tools')
source=("${_pkgname}::svn+http://svn.aircrack-ng.org/trunk")
sha256sums=('SKIP')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver() {
	cd "${srcdir}/${_pkgname}"
	svn info | awk '/Revision/{r=$2}/Date/{gsub(/-/,"");d=$4}END{print d"."r}'
}

_opts='sqlite=true experimental=true ext_scripts=true'

build() {
	cd "${srcdir}/${_pkgname}"
	make ${_opts}
}

package() {
	cd "${srcdir}/${_pkgname}"
	make ${_opts} \
		DESTDIR="${pkgdir}" \
		sbindir=/usr/bin \
		prefix=/usr \
		etcdir=/etc \
		install
}
