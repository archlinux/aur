# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 

pkgname=schain
pkgver=2.4.0
pkgrel=1
pkgdesc='A simple habit tracker'
arch=('x86_64' 'aarch64')
url="https://sr.ht/~arivigo/${pkgname}"
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://git.sr.ht/~arivigo/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('5a55477e941a9b950c3e273b2f55a3f2bba7373d2838fe0e0008b9d73cf47d63')
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
