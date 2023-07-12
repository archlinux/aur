# Maintainer: Steven Guikal <aur-void@fluix.one>
# Co-Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
pkgname=sline
pkgver=3.0.0
pkgrel=1
pkgdesc='Simple line-editing and command history library.'
arch=('any')
url="https://git.sr.ht/~ariadnavigo/${pkgname}"
license=('MIT')
depends=('glibc')
makedepends=('scdoc')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('a3a9e79eb4d29efc6d1822bdb1c8a04ad3af445fb86588e0d8ccafa2e2ee4880b3cd6b4f0982d10c68f2a37476b124bfa96a69433b42c57530ff20527170f258')

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
