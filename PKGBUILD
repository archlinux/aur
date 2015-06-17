# Maintainer: juantascon <juantascon.aur@horlux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=pal
pkgver=0.4.3
pkgrel=6
pkgdesc="A command-line calendar program."
arch=('i686' 'x86_64')
url="http://palcal.sourceforge.net"
license=('GPL')
depends=('pkg-config' 'glib2' 'readline' 'gettext')
source=(http://iweb.dl.sourceforge.net/project/palcal/pal/$pkgver/$pkgname-$pkgver.tgz)
sha256sums=('ce470cb7be76522ff58cd0325ad7817b6cc2132a5e0cea55de8c9eb63b54551c')

prepare() {
  cd ${srcdir}/${pkgname}-${pkgver}/src
  sed -i "s:-O2 -Wall:${CFLAGS}:g" Makefile.defs
  sed -i "s: (Function\*)::" manage.c
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}/src
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}/src
  make DESTDIR=${pkgdir} install-no-rm 
}
