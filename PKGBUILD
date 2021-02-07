# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Tool for working with NewGRF mod files for OpenTTD'
pkgname=yagl
pkgver=0.4
pkgrel=1
url=https://github.com/UnicycleBloke/yagl
license=(GPL3)
arch=(x86_64)
makedepends=(python cmake ninja git)
depends=(libpng)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('4371f08fe35556f79a600e4063e5733d648493e17db555cd34585a4000e04d68ba2ee78c981f2d5a10b325fbed52efe526bb6540cdc501d767f112d659d59697')

build () {
	cd "${pkgname}-${pkgver}"
	cmake -GNinja -DCMAKE_INSTALL_PREFIX=/usr -S. -B_build
	cmake --build _build
}

package () {
	# There is no "install" target, make do by hand.
	cd "${pkgname}-${pkgver}"
	install -Dm755 -t "${pkgdir}/usr/bin" _build/yagl
	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}/" README.md
}
