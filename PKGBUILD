# Maintainer: Zes4Null <rjw1248[at]hotmail[dot]com>
# Contributor: Philip <philip1731 protonmail ch>

pkgname=qucs-s
pkgver=1.0.0
pkgrel=1
pkgdesc="A spin-off of Qucs that supports other free SPICE circuit simulators like ngspice with the same Qucs GUI"
arch=('x86_64' 'i686')
url="https://ra3xdh.github.io"
license=('GPL')
options=(!makeflags)
depends=('qt5-svg')
makedepends=('cmake' 'qt5-tools')
optdepends=('ngspice: recommended simulation backend'
            'qucs: for Qucsator simulation backend'
            'xyce-serial: a SPICE-compatible simulation backend'
            'spiceopus: a general purpose simulation backend for optimization loops'
            )
source=(https://github.com/ra3xdh/qucs_s/releases/download/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('fc8d446a52dd4730ccba021df8f8a5331d22e1a26edd5d853c2d16518d32953f')

build() {
  cd $srcdir/$pkgname-$pkgver
  mkdir -p builddir
  cd builddir
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver/builddir
  make DESTDIR="$pkgdir" install
}
