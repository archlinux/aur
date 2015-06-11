# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Feufochmar <feufochmar@d-20.fr>
pkgname=wmpower
pkgver=0.4.3
pkgrel=2
pkgdesc="A Window Maker applet showing power management status"
arch=('i686' 'x86_64')
url="http://wmpower.sourceforge.net/"
license=('GPL')
depends=('libxpm')
optdepends=('cpufreqd')
source=("http://downloads.sourceforge.net/wmpower/$pkgname-$pkgver.tar.bz2"
	"$pkgname.patch")
md5sums=('22be08382dc408f3b925a198e46dd0be'
         '30d429437f41b539c07ba806065c6839')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np2 -b -z .orig -i "$srcdir/$pkgname.patch"
  autoreconf -fiv
  ./configure --prefix=/usr
  make
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
