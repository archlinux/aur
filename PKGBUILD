# Maintainer: Zes4Null <rjw1248[at]hotmail[dot]com>
# Contributor: Philip <philip1731 protonmail ch>

pkgname=qucs-s
pkgver=25.1.0
pkgrel=1
pkgdesc="A spin-off of Qucs that supports other free SPICE circuit simulators like ngspice with the same Qucs GUI"
arch=(
  x86_64
  i686
)
url="https://ra3xdh.github.io"
license=(GPL-2.0)
depends=(
  qt6-svg
  qt6-charts
  ngspice
)
makedepends=(
  cmake
  qt6-tools
  gperf
  dos2unix
)
optdepends=(
  'ngspice: recommended simulation backend'
  'qucs: for Qucsator simulation backend'
  'xyce-serial: SPICE-compatible simulation backend'
  'spiceopus: general purpose simulation backend for optimization loops'
  'openvaf: compiler for Verilog-A devices support'
  'octave: high-level language for post-simulation data processing'
)
source=(https://github.com/ra3xdh/qucs_s/releases/download/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('66fcbaf56cec741ed7f5d60491a1ffafcc1fb5d96485df8319012d2c66a11fee')

build() {
  cd $srcdir/$pkgname-$pkgver
  mkdir -p builddir
  cd builddir
  cmake \
	  -DCMAKE_INSTALL_PREFIX=/usr \
	  ..
  cmake --build . -j $(nproc)
}

package() {
  cd $srcdir/$pkgname-$pkgver/builddir
  DESTDIR="$pkgdir" cmake --install .
}
