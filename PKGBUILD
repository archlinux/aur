# Maintainer: sytabaresa <sytabaresa@gmail.com>

pkgname=qucs-s
_pkgname=qucs
pkgver=0.0.19S
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
source=(https://github.com/ra3xdh/$_pkgname/releases/download/$pkgver/$_pkgname-$pkgver.tar.gz)
sha1sums=('6c7a527886592dbdc6a061fc03fb0d6101f6a70a')

build() {
  cd $srcdir/qucs-$pkgver
  mkdir builddir
  cd builddir
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd $srcdir/qucs-$pkgver/builddir
  make DESTDIR="$pkgdir" install
}

