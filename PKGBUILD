# Maintainer: flippantwalrus <aur at hexoasm dot net>

pkgname=nabud-git
pkgver=1.3.1.r1.g223ec92
pkgrel=1
pkgdesc="A server for the NABU PC"
arch=(x86_64)
url="https://github.com/thorpej/nabud"
license=(BSD)
depends=(glibc openssl readline)
makedepends=(git)
provides=(nabud)
conflicts=(nabud)
source=("git+${url}.git")
sha256sums=("SKIP")

pkgver() {
	cd "${srcdir}/nabud"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/nabud"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/nabud"
	make DESTDIR="${pkgdir}" install
	install -D LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
