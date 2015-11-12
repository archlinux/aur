# Contributor: Simon Lundström <simlu@su.se>
# Maintainer: Simon Lundström <simlu@su.se> (or you?)

pkgname=rancid
pkgver=3.2
pkgrel=1
pkgdesc="Really Awesome New Cisco confIg Differ"
arch=('i686' 'x86_64')
url="http://www.shrubbery.net/rancid/"
license=('BSD')
depends=('expect')
source=( ftp://ftp.shrubbery.net/pub/rancid/${pkgname}-${pkgver}.tar.gz )
sha256sums=('e7da7242c1f072700b8d6077314be91c1fabe62528de2bdf91349b7094729e75')

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
