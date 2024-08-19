# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=libslink
pkgver=4.0.0
pkgrel=1
pkgdesc="A SeedLink client library written in C."
arch=("x86_64")
url="https://github.com/EarthScope/libslink"
license=('Apache-2.0')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f4f3d721cd76d7d974752647571a7485d32ff53eb2d478463e87dbf0e9f7121b')

prepare() {
	cd "${pkgname}-${pkgver}"
	sed -i 's|^PREFIX ?=.*|PREFIX ?= /usr|' Makefile
}

build() {
	cd "${pkgname}-${pkgver}"
	make shared
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR=${pkgdir} install
	install -D -t ${pkgdir}/usr/share/doc/${pkgname}/ -m 644 docs/UsersGuide-libslink
	install -D -t ${pkgdir}/usr/share/licenses/${pkgname}/ -m 644 LICENSE
}
# vim:set ts=4 sw=4 et:
