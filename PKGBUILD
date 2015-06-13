# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=locarna
pkgver=1.8.0
pkgrel=1
pkgdesc='Global and Local Alignment of RNAs'
arch=('i686' 'x86_64')
url="http://www.bioinf.uni-freiburg.de/Software/LocARNA/"
license=('GPL3')
depends=('viennarna2>=2.1.1')
checkdepends=()
source=("http://www.bioinf.uni-freiburg.de/Software/LocARNA/Releases/locarna-$pkgver.tar.gz")
md5sums=('f708db513e24aa01658d3468888854fc')

build() {
  cd "$srcdir/locarna-$pkgver"

  ./configure --prefix=/usr \
              --disable-static \
              --with-vrna=/usr \
              --enable-librna

  make
}

check() {
   cd "$srcdir/locarna-$pkgver"

   make check
}

package() {
  cd "$srcdir/locarna-$pkgver"

  make DESTDIR="$pkgdir" install

  # cleanup after dirty install ...
  for perlscript in "$pkgdir"/usr/bin/*.pl ; do
    mv "$perlscript" "$pkgdir/usr/bin/$(basename "$perlscript" .pl)"
  done

  # TODO bin contains .pm
  # TODO lib/perl not in std perl site package
}
