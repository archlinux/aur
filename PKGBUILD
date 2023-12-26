# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=blahaj
_pkgname="${pkgname^^}"
pkgver=2.2.0
pkgrel=1
pkgdesc="Gay sharks at your local terminal - lolcat-like CLI tool"
arch=('x86_64')
url="https://blahaj.queer.software"
license=('BSD')
depends=('crystal' 'libyaml')
makedepends=('shards')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/GeopJr/BLAHAJ/archive/v${pkgver}.tar.gz")
sha256sums=('07f025c480f398ce9c83e20f411c825a923ea9cdc505bd40c7110b5f68dcd492')

build () {
	cd "${_pkgname}-${pkgver}"
	CRYSTAL_CACHE_DIR=crystal make build_mt	
}

check () {
	cd "${_pkgname}-${pkgver}"
	CRYSTAL_CACHE_DIR=crystal make test_mt
}

package() {
	cd "${_pkgname}-${pkgver}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install

	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
