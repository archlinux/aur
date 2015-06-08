# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=cauchy-hg
_hgrepo=cauchy
pkgver=446.814aa99d9341
pkgrel=1
pkgdesc='Matlab/Octave to MathML compiler'
arch=('i686' 'x86_64')
url='https://bitbucket.org/cyrille/cauchy'
license=('LGPL')
depends=('eigen' 'gcc-libs')
makedepends=('cmake' 'mercurial')
conflicts=('cauchy')
provides=('cauchy')
source=('hg+https://bitbucket.org/cyrille/cauchy')
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/$_hgrepo
  printf "%s.%s" $(hg identify -n) $(hg identify -i)
}

build() {	
  cd ${srcdir}/$_hgrepo
  cmake $srcdir/$_hgrepo -DCMAKE_BUILD_TYPE=debugfull \
	-DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd ${srcdir}/$_hgrepo
  make DESTDIR=${pkgdir} install
}
