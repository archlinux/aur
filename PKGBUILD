# Maintainer: sytabaresa <sytabaresa@gmail.com>

pkgname=qucs-s
pkgver=0.0.21
pkgrel=1
pkgdesc="A spin-off of Qucs that supports other free SPICE circuit simulators like ngspice with the same Qucs GUI"
arch=('x86_64' 'i686')
url="https://ra3xdh.github.io"
license=('GPL')
options=(!makeflags)
depends=('qt4')
makedepends=('cmake' 'autoconf' 'automake' 'perl-gd' 'perl-xml-libxml' 'gperf' 'libtool' 'flex' 'bison')
optdepends=('ngspice: recommended simulation backend'
            'qucs: for Qucsator simulation backend'
            'freehdl: to permit digital circuit simulation'
            'asco: to enable circuit optimization'
            )
source=(https://github.com/ra3xdh/qucs_s/releases/download/$pkgver/$pkgname-$pkgver.tar.gz)
sha1sums=('7879565da266ce6562db274d3298bf7bef8c389f')

build() {
  cd $srcdir/$pkgname-$pkgver
  mkdir builddir
  cd builddir
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver/builddir
  make DESTDIR="$pkgdir" install
}