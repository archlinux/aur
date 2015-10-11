# Maintainer: Samuel Tardieu <sam@rfc1149.net>

pkgname=recoverjpeg 
pkgver=2.5
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="recover lost jpeg (.jpg) and mov files from a raw disk"
url="http://www.rfc1149.net/devel/recoverjpeg"
license=('GPL')
depends=('bash' 'python2')
source=(http://www.rfc1149.net/download/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('da7427d78b702fb1123f300f95ba104a')

build() {
  cd ${pkgname}-${pkgver}
  sed -i '1s,.*,#! /usr/bin/python2,' remove-duplicates
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}/" install
  install -D -m 644 COPYING ${pkgdir}/usr/share/licenses/$pkgname/COPYING
}

# vim:set ts=2 sw=2 et:
