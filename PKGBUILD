# Maintainer: Zes4Null <rjw1248[at]hotmail[dot]com>
# Contributor: Philip <philip1731 protonmail ch>

pkgname=qucs-s
pkgver=1.0.1
pkgrel=1
pkgdesc="A spin-off of Qucs that supports other free SPICE circuit simulators like ngspice with the same Qucs GUI"
arch=('x86_64' 'i686')
url="https://ra3xdh.github.io"
license=('GPL')
options=(!makeflags)
depends=('qt6-svg' 'ngspice')
makedepends=('cmake' 'qt6-tools')
optdepends=('ngspice: recommended simulation backend'
            'qucs: for Qucsator simulation backend'
            'xyce-serial: a SPICE-compatible simulation backend'
            'spiceopus: a general purpose simulation backend for optimization loops'
            )
source=(https://github.com/ra3xdh/qucs_s/releases/download/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('6ba278a91fab96d6a3d2f17d590997725146f415030217bc3e7f3cf2c5f7c14b')

build() {
  cd $srcdir/$pkgname-$pkgver
  mkdir -p builddir
  cd builddir
  cmake \
	  -DCMAKE_INSTALL_PREFIX=/usr \
	  -DWITH_QT6=ON \
	  ..
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver/builddir
  make DESTDIR="$pkgdir" install
}
