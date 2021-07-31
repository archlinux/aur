# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Charles L <charliehogger31@gmail.com>
# Contributor: Ariadna Vigo

pkgname=minitimer
pkgver=4.1.1
pkgrel=4
pkgdesc='Mini Timer - A timer in your terminal'
arch=('x86_64' 'aarch64')
url="https://sr.ht/~arivigo/${pkgname}"
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://git.sr.ht/~arivigo/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('5a07140c91008a0802fce15760dd4f9a6fef6245951b2ad41a5f63cad4a16128')
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
