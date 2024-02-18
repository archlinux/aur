# Maintainer: Zes4Null <rjw1248[at]hotmail[dot]com>
# Contributor: Philip <philip1731 protonmail ch>

pkgname=qucs-s
pkgver=24.1.0
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
sha256sums=('ce6e03e26fddbe107d1749329423214c2714d3103f9a528bbcccd228eb14bac0')

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
