# Maintainer: Zes4Null <rjw1248[at]hotmail[dot]com>
# Contributor: Philip <philip1731 protonmail ch>

pkgname=qucs-s
pkgver=1.1.0
pkgrel=1
pkgdesc="A spin-off of Qucs that supports other free SPICE circuit simulators like ngspice with the same Qucs GUI"
arch=('x86_64' 'i686')
url="https://ra3xdh.github.io"
license=('GPL')
depends=('qt6-svg' 'ngspice')
makedepends=('cmake' 'qt6-tools')
optdepends=('ngspice: recommended simulation backend'
            'qucs: for Qucsator simulation backend'
            'xyce-serial: a SPICE-compatible simulation backend'
            'spiceopus: a general purpose simulation backend for optimization loops'
            'octave: a high-level language for post-simulation data processing'
            )
source=(https://github.com/ra3xdh/qucs_s/releases/download/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('15aa734db9be6d8a8fc87a0782bf1be418c7bf59dfe06a957c904ff8f7d5f096')

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
