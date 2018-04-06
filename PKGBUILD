# Maintainer: Josef Miegl <josef@miegl.cz>
# Contributor: Gaetan Bisson <bisson@archlinux.org
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: Daenyth <Daenyth+Arch [at] gmail [dot] com>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: ice-man <icemanf@gmail.com>

pkgname=aircrack-ng-git
_pkgname=aircrack-ng
pkgver=1.2.rc5.r8.g9b3fbbfe
pkgrel=1
pkgdesc='WiFi security auditing tools suite'
url='https://aircrack-ng.org/'
arch=('i686' 'x86_64' 'armv7h')
license=('GPL2')
makedepends=('git' 'python')
depends=('gcc-libs' 'libnl' 'openssl' 'sqlite' 'iw' 'ethtool' 'net-tools')
optdepends=('python: dump-join, airgraph-ng, versuck-ng, airdrop-ng')
source=("git://github.com/aircrack-ng/aircrack-ng.git")
sha256sums=('SKIP')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
replaces=('aircrack-ng-svn')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_pkgname}"
	autoreconf -i
	./configure --with-experimental --with-ext-scripts
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	make \
		DESTDIR="${pkgdir}" \
		sbindir=/usr/bin \
		prefix=/usr \
		etcdir=/etc \
		install
}

