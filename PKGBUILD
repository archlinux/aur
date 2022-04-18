# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 

pkgname=schain
pkgver=3.0.1
pkgrel=1
pkgdesc='A simple habit tracker'
arch=('x86_64' 'aarch64')
url="https://sr.ht/~arivigo/${pkgname}"
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://git.sr.ht/~arivigo/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('69b9a8a055f826e37cc6892960afc95b9ad36453337ef11a22bfb7fdfce92a88')
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
