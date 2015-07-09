# $Id: PKGBUILD,v 1.4 2004/04/19 06:24:58 dorphell Exp $
# Maintainer: eric <eric@archlinux.org>
# Contributor: Manolis Tzanidakis
#

pkgname=gkx86info
pkgver=0.0.2
pkgrel=3
pkgdesc="GKrellM plugin to display CPU speed (useful for clock stepping)"
depends=('gkrellm')
arch=('i686' 'x86_64')
license=('GPL2')
url="http://anchois.free.fr"
source=(http://anchois.free.fr/gkx86info2-${pkgver}.tar.gz)
md5sums=('e893ac5db865b4621c9f880686d30a99')

build() {
  cd "$srcdir/${pkgname}${pkgver}"
  gcc $CFLAGS -fPIC `pkg-config gtk+-2.0 --cflags`  -c gkx86info.c
  gcc $CFLAGS -fPIC -o MHz.o -c MHz.c
  gcc -shared -o gkx86info.so MHz.o  gkx86info.o
}
package() {
  cd "$srcdir/${pkgname}${pkgver}"
  install -Dm755 $pkgname.so "$pkgdir/usr/lib/gkrellm2/plugins/$pkgname.so"
}
