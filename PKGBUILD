# Maintainer: Zes4Null <rjw1248[at]hotmail[dot]com>
# Contributor: Philip <philip1731 protonmail ch>

pkgname=qucs-s
pkgver=24.3.2
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
sha256sums=('d6685352f75b9ab1571ce91e9435e4aa89146d8e4d2023ff1a7bb18bcbb65c18')

build() {
  cd $srcdir/$pkgname-$pkgver
  mkdir -p builddir
  cd builddir
  cmake \
	  -DCMAKE_INSTALL_PREFIX=/usr \
    -DWITH_QT6=ON \
	  ..
  cmake --build .
}

package() {
  cd $srcdir/$pkgname-$pkgver/builddir
  DESTDIR="$pkgdir" cmake --install .
}
