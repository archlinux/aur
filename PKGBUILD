# Maintainer: Stanislaw Grams <sjg@fmdx.pl>
pkgname=antpatt
pkgver=1.1
pkgrel=3
pkgdesc="Antenna pattern plotting and analysis software."
arch=('x86_64' 'i686')
url="https://github.com/kkonradpl/antpatt"
license=('GPL2')
depends=('gtk3')
provides=('antpatt')
conflicts=('antpatt')
makedepends=('git' 'cmake' 'ninja' 'pkgconf' 'gtk3' 'json-c' 'zlib' 'gsl')
source=("https://github.com/kkonradpl/antpatt/archive/refs/tags/v1.1.tar.gz")
sha256sums=('b0599e30f8ce4337c88f0d63edf0183c80e2c933de78508632ff7bb44723b129')

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
