# Contributor: Patrick Mischke

pkgname='python-pairinteraction'
_name='pairinteraction'
_py="py3"
pkgver=0.9.9
pkgrel=2
pkgdesc="A Rydberg Interaction Calculator"
url="https://github.com/pairinteraction/pairinteraction"
depends=('python-numpy' 'python-scipy' 'python-pint' 'python-pyqtgraph' 'python-pyzmq' 'sqlite' 'gsl' 'swig' 'lapacke')
makedepends=('python-pip' 'doctest' 'fmt' 'eigen' 'boost')
license=('GPL3' 'LGPL3')
arch=('x86_64')
options=('!buildflags' 'staticlibs' '!strip' 'libtool')
#source=("https://github.com/pairinteraction/pairinteraction/archive/refs/heads/master.zip")
source=("https://github.com/pairinteraction/pairinteraction/archive/refs/tags/v$pkgver.tar.gz")

#sha256sums=("SKIP")
sha256sums=("800529dac49a7723969f4d0388ee66869c8728178b6b17d13f12856204b79fc2")

build() {
#  cd "$srcdir/pairinteraction-master"
  cd $srcdir/pairinteraction-$pkgver
  mkdir build
  cd build
  cmake ..
  make -j 8
}

package() {
#  cd "$srcdir/pairinteraction-master/build"
  cd "$srcdir/pairinteraction-$pkgver/build"
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps .
}
