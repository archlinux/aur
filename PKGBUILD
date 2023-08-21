# Maintainer: Zes4Null <rjw1248[at]hotmail[dot]com>
# Contributor: Philip <philip1731 protonmail ch>

pkgname=qucs-s
pkgver=2.0.0
pkgrel=1
pkgdesc="A spin-off of Qucs that supports other free SPICE circuit simulators like ngspice with the same Qucs GUI"
arch=('x86_64' 'i686')
url="https://ra3xdh.github.io"
license=('GPL')
depends=('qt6-svg' 'ngspice')
makedepends=('cmake' 'qt6-tools')
optdepends=('ngspice: recommended simulation backend'
            'qucs: for Qucsator simulation backend'
            'xyce-serial: SPICE-compatible simulation backend'
            'spiceopus: general purpose simulation backend for optimization loops'
            'openvaf: compiler for Verilog-A devices support'
            'octave: high-level language for post-simulation data processing'
            )
source=(https://github.com/ra3xdh/qucs_s/releases/download/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('19190fca637c3a9b368e50eedff9d764ae659fd1203cb77ba2a11a97eb71870f')

build() {
  export QT_DIR=/usr/lib/cmake/Qt6/
  cd $srcdir/$pkgname-$pkgver
  mkdir -p builddir
  cd builddir
  cmake \
	  -DCMAKE_INSTALL_PREFIX=/usr \
	  ..
  make -j$(nproc) 
}

package() {
  cd $srcdir/$pkgname-$pkgver/builddir
  make DESTDIR="$pkgdir" install
}
