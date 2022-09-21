# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 

pkgname=c2f
pkgver=0.3.2
pkgrel=1
pkgdesc='Celsius/Fahrenheit converter in C99'
arch=('x86_64' 'aarch64')
url="https://github.com/ariadnavigo/cras/${pkgname}"
license=('MIT')
depends=('sline')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ariadnavigo/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('35b6e5a19651cbb4e7c87e9fbe93df3fc1c896eee2008f4e6c9ebe0c283b17af')
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
