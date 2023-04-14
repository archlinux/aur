# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=blahaj
_pkgname=BLAHAJ
pkgver=2.0.1
pkgrel=1
pkgdesc="Gay sharks at your local terminal - lolcat-like CLI tool"
arch=('x86_64')
url="https://blahaj.queer.software"
license=('BSD')
depends=('crystal' 'shards')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/GeopJr/BLAHAJ/archive/v${pkgver}.tar.gz")
sha256sums=('04d6b8e1b5f151c7c04335f758e4184408d12cfa024abd7583a25e933b681cbc')

build () {
	cd "${_pkgname}-${pkgver}"
	make build_mt 
}

check () {
	cd "${_pkgname}-${pkgver}"
	make test_mt 
}

package() {
	cd "${_pkgname}-${pkgver}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install

	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
