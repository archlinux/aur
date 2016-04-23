# Maintainer: Bruce Lee <cainsdao AT tuta D0T io>

pkgname=skroll-git
_pkgname=skroll
pkgver=0.6.r1.g2fb17ec
pkgrel=1
pkgdesc="Scrolls text"
arch=('i686' 'x86_64')
url="http://git.z3bra.org/skroll/log.html"
license=('WTFPLv2')
makedepends=('git' 'gzip')
source=('git://z3bra.org/skroll')
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  make
}

package() {
  cd "$_pkgname"
  make PREFIX="/usr" DESTDIR="${pkgdir}" MANPREFIX="/usr/share/man" install
  gzip -f9 skroll.1
  install -Dm644 README "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 LICENSE "${pkgdir}/usr/share/doc/${pkgname}/README"
}
