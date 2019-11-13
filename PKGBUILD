# Maintainer: Steven Allen <steven@stebalien.com>
# Contributor: Tobias Mueller <gtklp@sirtobi.com>
pkgname=gtklp
pkgver=1.3.4
pkgrel=1
pkgdesc="a graphical frontend for cups, the linux printing system"
arch=(i686 x86_64)
url="http://gtklp.sirtobi.com/"
license=('GPL')
depends=('cups' 'gtk2')
source=(gtklp-$pkgver.src.tar.gz::https://sourceforge.net/projects/gtklp/files/gtklp/$pkgver/gtklp-$pkgver.src.tar.gz/download)
sha256sums=('be07609042595fa932034e3b2d7038cef33901ec0863fcedbb5188acb6b53bab')

build() {
  cd $srcdir/$pkgname-$pkgver

  # The configure script is really out of date...
  aclocal -I m4
  autoheader --force
  autoconf --force
  automake --add-missing --copy --include-deps --foreign --force-missing

  ./configure --prefix=/usr
  make
}
package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}


