# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 

pkgname=cras
pkgver=2.2.1
pkgrel=1
pkgdesc='The Anti-Procrastination Tool'
arch=('x86_64' 'aarch64')
url="https://github.com/ariadnavigo/${pkgname}"
license=('MIT')
depends=('sline')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('7d974eeed709d9a6ae7b365f402db091122f726d5a582f1906c26228bf60416c')
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
