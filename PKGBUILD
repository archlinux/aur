# Maintainer: Jonathan Liu <net147@gmail.com>
pkgname=evrouter
pkgver=0.4
pkgrel=3
pkgdesc="An Input Event Router for Linux"
arch=('i686' 'x86_64')
url="http://www.bedroomlan.org/~alexios/coding_evrouter.html"
license=('GPL2')
depends=('libxtst')
makedepends=('automake>=1.10.1')
source=(http://debian.bedroomlan.org/debian/pool/main/e/${pkgname}/${pkgname}_${pkgver}.tar.gz)
md5sums=('eef1b9d8e3b545c330eb025670ffa3e8')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  aclocal
  automake --add-missing
  ./configure --prefix=/usr --without-xmms
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -D -m644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -D -m644 debian/changelog "${pkgdir}/usr/share/doc/${pkgname}/changelog"
  install -D -m644 debian/copyright "${pkgdir}/usr/share/doc/${pkgname}/copyright"
  install -D -m755 src/example "${pkgdir}/usr/share/doc/${pkgname}/examples/example"
}

# vim:set ts=2 sw=2 et:
