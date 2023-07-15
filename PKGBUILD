# Maintainer: Atle Solbakken <atle@goliathdns.no>
pkgname="libartnet"
pkgver=1.2.0
pkgrel=1
pkgdesc="libartnet is an implementation of the ArtNet protocol which allows for transmission of DMX data over IP networks"
arch=('i686' 'arm64' 'x86_64' 'aarch64')
url="https://www.github.com/atlesn/libartnet"
license=('LGPL')
depends=()
makedepends=('git')
provides=('libartnet')
source=("git+https://github.com/atlesn/$pkgname.git#tag=v1.2.0")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
	cd "${srcdir}/${pkgname}"
}

build() {
	cd "${srcdir}/${pkgname}"
	autoreconf -i
	./configure --prefix=/usr --sysconfdir=/etc
	make
}

check() {
	cd "${srcdir}/${pkgname}"
	make -k check
}

package() {
	cd "${srcdir}/${pkgname}"
	make DESTDIR="${pkgdir}/" install
}
