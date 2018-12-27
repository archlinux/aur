# Maintainer: Josef Miegl <josef@miegl.cz>
# Contributor: Gaetan Bisson <bisson@archlinux.org
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: Daenyth <Daenyth+Arch [at] gmail [dot] com>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: ice-man <icemanf@gmail.com>
# Contributor: codyps <archlinux@codyps.com>

pkgname=aircrack-ng-git
_pkgname=aircrack-ng
pkgver=20180518.e9430e64
pkgrel=1
pkgdesc='WiFi security auditing tools suite'
url='https://aircrack-ng.org/'
arch=('i686' 'x86_64' 'armv7h')
license=('GPL2')
makedepends=('git' 'python')
depends=('gcc-libs' 'libnl' 'openssl' 'sqlite' 'iw' 'ethtool' 'net-tools')
optdepends=('python: dump-join, airgraph-ng, versuck-ng, airdrop-ng')
provides=("${_pkgname}" 'aircrack-ng-scripts')
conflicts=("${_pkgname}" 'aircrack-ng-scripts')
replaces=('aircrack-ng-svn' 'aircrack-ng-scripts')
source=("git://github.com/aircrack-ng/aircrack-ng.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
	cd "${srcdir}/${_pkgname}"
	autoreconf -i
	./configure --with-experimental --with-ext-scripts --prefix=/usr --sbindir=/usr/bin
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	make DESTDIR="${pkgdir}" install
}

