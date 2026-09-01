# Maintainer: Omar Pakker <archlinux@opakker.nl>
# Contributor: Parker Reed <parker.l.reed@gmail.com>
# Contributor: dale <dale@archlinux.org>

_pkgname=pilot-link
pkgname="${_pkgname}-git"
pkgver=r2021.62b50b94
pkgrel=1
pkgdesc="A suite of tools for connecting to PalmOS handheld devices"
url="http://www.pilot-link.org/"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
license=('GPL-2.0-or-later' 'LGPL-2.0-or-later')
depends=('readline' 'libpng' 'libusb-compat' 'popt' 'bluez-libs')
makedepends=('git')
options=('!libtool')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/desrod/pilot-link.git")
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}"

	./autogen.sh \
		--prefix=/usr \
		--enable-conduits \
		--enable-libusb \
		--with-libiconv \
		--with-libpng

	make
}

package() {
	cd "${srcdir}/${_pkgname}"

	make DESTDIR="${pkgdir}" install
}
