# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=ttyplot
pkgver=1.6.2
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
sha256sums=('99222721e2d89e1064546f29e678830ccaba9b75f276a4b6845cc091169787a0')
b2sums=('c7a818a69774fc7c5f6b498e5bf2f9c3ec644dc23d54daf59adaf13962f614c23918ca1d84614e27c60e75d1b98b3eb3c548dc14b59b539acceb3327dafabe0c')

build() {
	make -C "${pkgname}-${pkgver}" PREFIX=/usr MANPREFIX=/usr/share/man
}

package() {
	make -C "${pkgname}-${pkgver}" PREFIX=/usr MANPREFIX=/usr/share/man \
		DESTDIR="${pkgdir}" install

	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
		"${pkgname}-${pkgver}/README.md"
}
