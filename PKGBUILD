# Maintainer: jxir <aur@jxir.de>

pkgname=tad-git
pkgver=0.4.r9.g0b13866
pkgrel=1
pkgdesc="Library and tools to handle data arrays in C++"
arch=('x86_64')
url="https://marlam.de/tad/"
license=('MIT')
depends=('ffmpeg' 'gdal' 'hdf5' 'libjpeg'  'libmatio' 'libpng' 'libtiff')
makedepends=('cmake' 'git')
provides=('tad')
conflicts=('tad')
source=('git+https://git.marlam.de/git/tad.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/tad"
  git describe --long --tags | sed 's/tad-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/tad"
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
}

build() {
  cd "$srcdir/tad/build"
  make
}

package() {
  cd "$srcdir/tad/build"
  make DESTDIR="$pkgdir" install
  install -Dm644 ../LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
