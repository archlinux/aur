# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 

pkgname=cras
pkgver=2.2.3
pkgrel=2
pkgdesc='The Anti-Procrastination Tool'
arch=('any')
url="https://git.sr.ht/~ariadnavigo/${pkgname}"
license=('MIT')
depends=('sline')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('6848a9a400221b2ed9201971326efe1f954bc855e5de31edbe5f8e9cc0672dfd')
conflicts=("${pkgname}-git")

build() {
	cd "${pkgname}-${pkgver}"
	make LDFLAGS="-Wl,-z,now"
}

package() {
	cd "${pkgname}-${pkgver}"
	make MANPREFIX=/usr/share/man DESTDIR="${pkgdir}" PREFIX='/usr' install
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
