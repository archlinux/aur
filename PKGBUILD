# Maintainer: Steven Guikal <aur-void@fluix.one>
# Co-Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 

pkgname=scalc
pkgver=2.0.4
pkgrel=1
pkgdesc='A very simple stack-based calculator that aims to be small, flexible, and extensible.'
arch=('any')
url="https://git.sr.ht/~ariadnavigo/${pkgname}"
license=('MIT')
depends=(sline)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('af2de795908e706b83fd747eee5db84201f73480640404826bf1000df4fcdf242f84ad23c1e5c0e1e9661bac0fb75ae43ae3a6a2c4980fcf82110e740c2497c8')

build() {
  cd "${pkgname}-${pkgver}"
  make LDFLAGS="-Wl,-z,now"
}

package() {
  cd "${pkgname}-${pkgver}"
  make PREFIX=/usr MANPREFIX=/usr/share/man DESTDIR="${pkgdir}/" install
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
