# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Charles L <charliehogger31@gmail.com>
# Contributor: Ariadna Vigo

pkgname=minitimer
pkgver=4.2.1
pkgrel=1
pkgdesc='Mini Timer - A timer in your terminal'
arch=('x86_64' 'aarch64')
url="https://github.com/ariadnavigo/${pkgname}"
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('03e986c9f3222dc5619fb23122dd664c9a925b23b8c9c3c573aeb8dd97cc1982')
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
