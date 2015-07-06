# Contributor: masutu <masutu dot arch at googlemail dot com>
# Maintainer: masutu <masutu dot arch at googlemail dot com>

pkgname=soundtank
pkgver=1.0.2
pkgrel=2
pkgdesc="Hosts LADSPA plugins in realtime objects"
arch=('i686' 'x86_64')
url="http://soundtank.sourceforge.net/"
license=('GPL')
depends=('jack' 'libxml2' 'popt')
source=(http://downloads.sourceforge.net/soundtank/$pkgname-$pkgver.tar.gz)
md5sums=('f2ac3809f26a1ff371e26d1c1e91f62b')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  aclocal
  automake --add-missing
  autoconf
  LDFLAGS="-ldl" ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  cd doc
  for file in *
    do install -D -m644 $file $pkgdir/usr/share/doc/${pkgname}/$file
  done
}

# vim:set ts=2 sw=2 et:

