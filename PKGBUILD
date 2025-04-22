# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=blahaj
pkgver=2.2.0
pkgrel=2
pkgdesc="Gay sharks at your local terminal - lolcat-like CLI tool"
url="https://blahaj.geopjr.dev"
arch=('x86_64')
license=('BSD-2-Clause')
depends=('crystal' 'libyaml')
makedepends=('shards')
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/GeopJr/BLAHAJ/archive/v${pkgver}.tar.gz")
sha256sums=('8786728d8e48212605156a09978ceb21b50740c27445fe9d95adee0ed875c2a2')

build () {
	cd "${pkgname}"
	CRYSTAL_CACHE_DIR=crystal make build_mt	
}

check () {
	cd "${pkgname}"
	CRYSTAL_CACHE_DIR=crystal make test_mt
}

package() {
	cd "${pkgname}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install

	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
