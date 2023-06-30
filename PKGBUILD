# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor : Steven Guikal <aur-void@fluix.one>
pkgname=sline
pkgver=2.0.2
pkgrel=2
pkgdesc='Simple line-editing and command history library.'
arch=(x86_64)
url='https://sr.ht/~ariadnavigo/sline/'
license=('MIT')
depends=(glibc)
source=("${pkgname}-${pkgver}.tar.gz::https://git.sr.ht/~ariadnavigo/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('e27d0902f46827820c5a28bfb5a4cf71efbee227e1f799211fbaf80542eb5b1c3a70120e7587fd28fc81033d40420ba3fd2b162ba45e58656c2c4bd5e96ea799')

build() {
  cd "${pkgname}-${pkgver}"
  sed -i "s/LDFLAGS.*$/&,-z,now/" config.mk
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make PREFIX=/usr MANPREFIX=/usr/share/man DESTDIR="${pkgdir}/" install
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
