# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=blahaj
_pkgname="${pkgname^^}"
pkgver=2.1.0
pkgrel=1
pkgdesc="Gay sharks at your local terminal - lolcat-like CLI tool"
arch=('x86_64')
url="https://blahaj.queer.software"
license=('BSD')
depends=('crystal' 'libyaml')
makedepends=('shards')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/GeopJr/BLAHAJ/archive/v${pkgver}.tar.gz")
sha256sums=('027e2aa8cc13690a99f0a1051509b420a2afc3ff08ed3014977351e12678d496')

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
