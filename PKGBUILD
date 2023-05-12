# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

pkgname=procmail
pkgver=3.24
pkgrel=3
pkgdesc="Highly configurable auto mail processing."
arch=('x86_64')
#url="http://www.procmail.org" # offline
url="https://github.com/BuGlessRB/procmail"
license=('GPL' 'custom:Artistic')
source=("https://github.com/BuGlessRB/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('514ea433339783e95df9321e794771e4887b9823ac55fdb2469702cf69bd3989')


build() {
  cd $pkgname-$pkgver
  yes n | make CFLAGS0="${CFLAGS} ${LDFLAGS}" LOCKINGTEST="/tmp ."
}

package() {
  cd $pkgname-$pkgver
  make BASENAME="${pkgdir}"/usr MANDIR="${pkgdir}"/usr/share/man install
  install -D -m644 Artistic "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
  install -d -m755 "${pkgdir}"/usr/share/doc/${pkgname}/examples
  install -m644 examples/* "${pkgdir}"/usr/share/doc/${pkgname}/examples/
}
