# Maintainer: Philip <philip1731 protonmail ch>

pkgname=qucs-s
pkgver=0.0.23
pkgrel=2
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
sha256sums=('ad2bccdf61a3df7fdfdcc233022d2d30c19bd5c73f54ac60ed6335f731af2f7c')

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
