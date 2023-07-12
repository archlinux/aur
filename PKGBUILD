# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 

pkgname=cras
pkgver=2.2.4
pkgrel=1
pkgdesc='The Anti-Procrastination Tool'
arch=('any')
url="https://git.sr.ht/~ariadnavigo/${pkgname}"
license=('MIT')
depends=('sline')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('3a43d702fc24168dd132e14f2c1abcc0851041f8e7936ffe9f83fea985d532cd')
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
