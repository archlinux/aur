# Maintainer: Stanislaw Grams <sjg@fmdx.pl>
pkgname=antpatt
pkgver=1.1.1
pkgrel=1
pkgdesc="Antenna pattern plotting and analysis software."
arch=('any')
url="https://github.com/kkonradpl/antpatt"
license=('GPL2')
depends=('gtk2')
provides=('antpatt')
conflicts=('antpatt')
makedepends=('git' 'cmake' 'ninja' 'pkgconf' 'gtk2' 'json-c' 'zlib' 'gsl')
source=("https://github.com/kkonradpl/antpatt/archive/refs/tags/v1.1.1.tar.gz")
sha256sums=('4712b792483c373873d300fc842e996212ed7cc20ccf5771cc513c10e34f2226')

build() {
  cd "$srcdir/"
  tar -xvf "v$pkgver.tar.gz"
  cd "$pkgname-$pkgver/build/"
  cmake .. -GNinja -Wall -DCMAKE_INSTALL_PREFIX='/usr'
  ninja
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build/"
  DESTDIR="$pkgdir" ninja install
}
