# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=ttyplot
pkgver=1.5.2
pkgrel=1
pkgdesc='A realtime plotting utility for terminal with data input from stdin'
arch=(x86_64)
url=https://github.com/tenox7/ttyplot
license=(Apache)
depends=(ncurses glibc)
makedepends=(make gcc pkg-config)
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tenox7/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('a0279e55c1996133645437ccb02574c82d62f0baa9744065779b5667c1f1cb8d')
b2sums=('a8ebf0529f1d3e65ec5887d0fc45c51840ddb26ed982ea5bc2e47d66c03878a642576c7b3052c717f296af9b3fe0fca15080cbf252cb274238e6b664372f219e')

build() {
	make -C "${pkgname}-${pkgver}" PREFIX=/usr MANPREFIX=/usr/share/man
}

package() {
	make -C "${pkgname}-${pkgver}" PREFIX=/usr MANPREFIX=/usr/share/man \
		DESTDIR="${pkgdir}" install

	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
		"${pkgname}-${pkgver}/README.md"
}
