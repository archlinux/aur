# Maintainer: Josef Miegl <josef@miegl.cz>

pkgname=aircrack-ng-git
_pkgname=aircrack-ng
pkgver=1.2.rc5.r8.g9b3fbbfe
pkgrel=1
pkgdesc='WiFi security auditing tools suite'
url='https://aircrack-ng.org/'
arch=('i686' 'x86_64' 'armv7h')
license=('GPL2')
makedepends=('git' 'autoconf' 'automake' 'pkg-config' 'make' 'gcc-libs')
depends=('openssl' 'iw' 'net-tools' 'shtool' 'ethtool' 'libnl' 'libtool')
source=("git://github.com/aircrack-ng/aircrack-ng.git")
sha256sums=('SKIP')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

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

