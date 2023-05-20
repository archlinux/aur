# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=blahaj
_pkgname="${pkgname^^}"
pkgver=2.0.2
pkgrel=1
pkgdesc="Gay sharks at your local terminal - lolcat-like CLI tool"
arch=('x86_64')
url="https://blahaj.queer.software"
license=('BSD')
depends=('crystal' 'libyaml')
makedepends=('shards')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/GeopJr/BLAHAJ/archive/v${pkgver}.tar.gz")
sha256sums=('bc0d95aac4c4afce9f268782e44325ba3e934d9cdc29dd2e4f98a9730a0c6131')

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
