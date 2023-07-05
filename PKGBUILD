# Maintainer: Bao Trinh <qubidt at gmail dot com>

pkgname=tthsum
pkgver=1.3.2
pkgrel=1
pkgdesc="generates or checks TTH message digests"
arch=('i686' 'x86_64')
url="http://tthsum.devs.nu"
license=('GPL3')
depends=('glibc')
makedepends=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/pkg/tthsum-${pkgver}.tar.gz")
md5sums=('4a3afe8e9bb5787c0db2de06484f18c1')

prepare() {
	cd "${pkgname}"
	sed -i 's,/usr/local/man,/usr/share/man,g; s,/usr/local/bin,/usr/bin,g' Makefile
}

build() {
	cd "${pkgname}"
	make tthsum
	make manual
	make test
}

check() {
	cd "${pkgname}"
	make runtest
}

package() {
	cd "${pkgname}"
	make DESTDIR="$pkgdir" install
	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.txt
}
