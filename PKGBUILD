# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=cauchy-hg
_hgrepo=cauchy
pkgver=446.814aa99d9341
pkgrel=3
pkgdesc='Matlab/Octave to C++ transformer'
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
  cd $_hgrepo
  printf "%s.%s" $(hg identify -n) $(hg identify -i)
}

build() {	
  cd $_hgrepo
  [[ -d build ]] || mkdir build
  cd build
  cmake .. -DCMAKE_BUILD_TYPE=Release \
	-DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd $_hgrepo/build
  make DESTDIR="$pkgdir" install
}
