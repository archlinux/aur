# Maintainer: Alexander Minges <alexander.minges@gmail.com>
# Contributor: Jakub Smulski <hgonomeg@gmail.com>

pkgname=libccp4
pkgver=8.0.0
pkgrel=2
pkgdesc="Protein X-ray crystallography toolkit - Libraries"
arch=('i686' 'x86_64')
url="http://www.ccp4.ac.uk/"
license=('GPL')
depends=('mmdb2>=2.0.19-1')
makedepends=('gcc-fortran')
conflicts=('libccp4-bzr')
source=(https://www2.mrc-lmb.cam.ac.uk/personal/pemsley/coot/dependencies/$pkgname-$pkgver.tar.gz)

sha256sums=('cb813ae86612a0866329deab7cee96eac573d81be5b240341d40f9ad5322ff2d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export CFLAGS="-std=gnu17"
  ./configure --prefix=/usr --enable-shared --datadir=/usr/share/ccp4 --disable-static --disable-fortran
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"  

  make DESTDIR="$pkgdir/" install
  # Some libraries, e.g. Clipper, need it as 'libccp4c.pc'
  install -dm755 "$pkgdir/usr/lib/pkgconfig"
  ln -s "/usr/lib/pkgconfig/ccp4c.pc" "$pkgdir/usr/lib/pkgconfig/libccp4c.pc"
} 
