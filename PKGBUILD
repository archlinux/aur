# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

_name=texi2html
pkgname=${_name}1.82
pkgver=1.82
pkgrel=1
pkgdesc="Converts texinfo documents to HTML (legacy)"
arch=('any')
url="http://www.nongnu.org/texi2html/"
license=('GPL')
depends=('perl')
provides=($_name=$pkgver)
source=(https://download.savannah.gnu.org/releases/texi2html/$_name-$pkgver.tar.bz2{,.sig})
sha256sums=('d69c1effc416896409003ea64fdb21152cc0a9a7c665d437a0a3bef9b588b4f1'
            'SKIP')
validpgpkeys=('CB6A07CA90C54234E8A3C8D02C3D4E4C17F231A4')
    # "Derek R. Price (Get CVS Support at <http://ximbiot.com>!) <derek@ximbiot.com>"

build() {
  cd "$srcdir/$_name-$pkgver"
  ./configure --prefix=/usr --program-suffix=$pkgver --datadir=/usr/share/$pkgname
  make
}

package() {
  cd "$srcdir/$_name-$pkgver"
  make DESTDIR="$pkgdir" install
  mv "$pkgdir"/usr/share/info/texi2html{,$pkgver}.info
  mv "$pkgdir"/usr/share/$pkgname/texinfo/html/texi2html{.html,$pkgver.html}
}
