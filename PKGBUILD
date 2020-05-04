# Maintainer: Oleksandr Natalenko aka post-factum <oleksandr@natalenko.name>
pkgname=pingtcp
pkgver=0.0.5
pkgrel=1
pkgdesc="Small utility to measure TCP handshake time (torify-friendly)"
url="https://gitlab.com/post-factum/${pkgname}"
arch=(x86_64)
license=(GPL3)
depends=(libbsd)
optdepends=("torsocks: for TOR support")
source=(${pkgname}-${pkgver}.tar.gz::https://gitlab.com/post-factum/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz)

sha256sums=('531d757be2a36b8b25e1577065c13864e595a26df21d467fd4c2f302f910efdc')

build() {
	cd "${pkgname}-v${pkgver}"

	make
}

package() {
	cd "${pkgname}-v${pkgver}"

	make DESTDIR="${pkgdir}" PREFIX="/usr" install

	install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README"
}

