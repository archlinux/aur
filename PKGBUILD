# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Charles L <charliehogger31@gmail.com>
# Contributor: Ariadna Vigo

pkgname=minitimer
pkgver=4.1.0
pkgrel=4
pkgdesc='Mini Timer - A timer in your terminal'
arch=('x86_64' 'aarch64')
url="https://sr.ht/~arivigo/${pkgname}"
license=('MIT')
source=("https://git.sr.ht/~arivigo/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('3ed359e733aa2a9afa31c33cb5db90157fd2d6e8e67e2448f390a21ee4fc0ff1')
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
