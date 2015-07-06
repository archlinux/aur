# Maintainer: Stefan Seemayer <mail@semicolonsoftware.de>
pkgname=glapse
pkgver=0.3
pkgrel=1
pkgdesc="Take desktop screenshots and glue them to make a time lapse video in GNU/Linux"
arch=(i686 x86_64)
url="http://code.google.com/p/glapse/"
license=('GPL')
depends=(python2 pygtk scrot)
source=(http://glapse.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('2cdc7d6966d2a52f547f1b42082299e2')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -ie "s/install -m/install -Dm/g" makefile
  sed -ie "s/LC_MESSAGES$/LC_MESSAGES\/glapse.mo/g" makefile
  sed -ie "s/python\b/python2/g" glapse.py glapse
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p "$pkgdir/usr/share/locale/{es,en}"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
