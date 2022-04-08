# Maintainer: Philip <philip1731 protonmail ch>

pkgname=qucs-s
pkgver=0.0.23
pkgrel=1
pkgdesc="A spin-off of Qucs that supports other free SPICE circuit simulators like ngspice with the same Qucs GUI"
arch=('x86_64' 'i686')
url="https://ra3xdh.github.io"
license=('GPL')
options=(!makeflags)
depends=('qt5-base')
makedepends=('cmake' 'autoconf' 'automake' 'perl-gd' 'perl-xml-libxml' 'gperf' 'libtool' 'flex' 'bison' 'qt5-tools' 'qt5-script')
optdepends=('ngspice: recommended simulation backend'
            'qucs: for Qucsator simulation backend'
            'freehdl: to permit digital circuit simulation'
            'asco: to enable circuit optimization'
            )
source=(https://github.com/ra3xdh/qucs_s/releases/download/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('6d2ba31d471cbd05fbc799e09b88f1bd4351cfed228883944968c771463e9376')

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
