# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=ttyplot
pkgver=1.7.0
pkgrel=1
pkgdesc='A realtime plotting utility for terminal with data input from stdin'
arch=(x86_64)
url=https://github.com/tenox7/ttyplot
license=(Apache-2.0)
depends=(ncurses glibc)
makedepends=(make gcc pkg-config)
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tenox7/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('f16ca828bf73f56c05ed4e1797a23861aa7cf3a98fe3fcc8c992d8646906fe51')
b2sums=('6a805855203fabc0528aebcf1c833f38386f1d54f2ec0f4189531ef387666a13d5a7413dde279d315795d80c6b3aa11ec7b748eb0370b121beb9499a18b19a2a')

build() {
	make -C "${pkgname}-${pkgver}" PREFIX=/usr MANPREFIX=/usr/share/man
}

package() {
	make -C "${pkgname}-${pkgver}" PREFIX=/usr MANPREFIX=/usr/share/man \
		DESTDIR="${pkgdir}" install

	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
		"${pkgname}-${pkgver}/README.md"
}
