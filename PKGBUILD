# Maintainer: Zes4Null <rjw1248[at]hotmail[dot]com>
# Contributor: Philip <philip1731 protonmail ch>

pkgname=qucs-s
pkgver=24.3.1
pkgrel=1
pkgdesc="A spin-off of Qucs that supports other free SPICE circuit simulators like ngspice with the same Qucs GUI"
arch=('x86_64' 'i686')
url="https://ra3xdh.github.io"
license=('GPL')
depends=('qt6-svg' 'ngspice')
makedepends=('cmake' 'qt6-tools' 'gperf' 'dos2unix')
optdepends=('ngspice: recommended simulation backend'
            'qucs: for Qucsator simulation backend'
   c         'xyce-serial: SPICE-compatible simulation backend'
            'spiceopus: general purpose simulation backend for optimization loops'
            'openvaf: compiler for Verilog-A devices support'
            'octave: high-level language for post-simulation data processing'
            )
source=(https://github.com/ra3xdh/qucs_s/releases/download/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('c6370e01495570f4c1c870a859d1197d0e3094f8de9e459f5c7dd1b1aec0a72e')

build() {
  cd $srcdir/$pkgname-$pkgver
  mkdir -p builddir
  cd builddir
  cmake \
	  -DCMAKE_INSTALL_PREFIX=/usr \
    -DWITH_QT6=ON \
	  ..
  make -j$(nproc) 
}

package() {
  cd $srcdir/$pkgname-$pkgver/builddir
  make DESTDIR="$pkgdir" install
}
