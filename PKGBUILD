# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=ttyplot
pkgver=1.6.1
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
sha256sums=('a6d0cfb2ec37ea6b4aaf978a8190ca0f42eacd4841f62da4ea2d93ecefc4dd28')
b2sums=('f78c5b7ef53e0bd1921138db965edcb9aff95d359263f1343ad2f33b075ff49ef0147354a7467de8cc5cc3a1f2508f9cf81fcbc6195c600d1fd07d0760de9b42')

build() {
	make -C "${pkgname}-${pkgver}" PREFIX=/usr MANPREFIX=/usr/share/man
}

package() {
	make -C "${pkgname}-${pkgver}" PREFIX=/usr MANPREFIX=/usr/share/man \
		DESTDIR="${pkgdir}" install

	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
		"${pkgname}-${pkgver}/README.md"
}
