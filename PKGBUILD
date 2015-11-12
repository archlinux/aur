# Contributor: Simon Lundström <simlu@su.se>
# Maintainer: Simon Lundström <simlu@su.se> (or you?)

pkgname=rancid
pkgver=2.3.8
pkgrel=2
pkgdesc="Really Awesome New Cisco confIg Differ"
arch=('i686' 'x86_64')
url="http://www.shrubbery.net/rancid/"
license=('BSD')
depends=('expect')
source=( ftp://ftp.shrubbery.net/pub/rancid/${pkgname}-${pkgver}.tar.gz )
sha256sums=('44e44c87a22968d5229c01d60aa46960da023a24846eef43f9e3c8d70fd5b3fb')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --libexecdir=/usr/lib
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  make DESTDIR=${pkgdir} install

  # ...
  install -D -m644 "${pkgdir}/usr/share/rancid/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
