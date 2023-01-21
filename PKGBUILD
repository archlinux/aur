# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Charles L <charliehogger31@gmail.com>
# Contributor: Ariadna Vigo

pkgname=minitimer
pkgver=4.2.2
pkgrel=1
pkgdesc='Mini Timer - A timer in your terminal'
arch=('x86_64' 'aarch64')
url="https://github.com/ariadnavigo/${pkgname}"
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('496496b1a390564f7b74551d2c0903bbcce1a43b46da2fe44a9de086ec15edba')
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
