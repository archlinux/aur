# Contributor: Simon Lundström <simlu@su.se>
# Maintainer: Simon Lundström <simlu@su.se> (or you?)

pkgname=rancid
pkgver=3.6.2
pkgrel=1
pkgdesc="Really Awesome New Cisco confIg Differ"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.shrubbery.net/rancid/"
license=('BSD')
depends=('expect')
source=( ftp://ftp.shrubbery.net/pub/rancid/${pkgname}-${pkgver}.tar.gz )
sha256sums=('23751829c9bacdd07f90512271265c0cac279ca2f36ac86be815dd21831c253d')

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
