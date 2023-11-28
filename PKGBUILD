# Contributor: Patrick Mischke

pkgname='python-pairinteraction'
_name='pairinteraction'
_py="py3"
pkgver=0.9.9
commit="e9ae50fc0d785a0f803ecfff6ce8ffec14cf937c"
pkgrel=5
pkgdesc="A Rydberg Interaction Calculator"
url="https://github.com/pairinteraction/pairinteraction"
depends=('cmake' 'python-numpy' 'python-scipy' 'python-pint' 'python-pyqtgraph' 'python-pyzmq' 'sqlite' 'gsl' 'swig' 'lapacke' 'cereal')
makedepends=('python-pip' 'doctest' 'fmt' 'eigen' 'boost')
license=('GPL3' 'LGPL3')
arch=('x86_64')
options=('!buildflags' 'staticlibs' '!strip' 'libtool')
# every once in a while an actual release is build and we can grab that
# source=("https://github.com/pairinteraction/pairinteraction/archive/refs/tags/v$pkgver.tar.gz")
# for now we just use the zip of whatever commit I updated this last
source=("https://github.com/pairinteraction/pairinteraction/archive/$commit.zip")

sha256sums=("fc0974b60c2b82f686afe21899cd82428570d336204792848fbdc23e715c65b0")

build() {
#  cd $srcdir/pairinteraction-$pkgver
  cd $srcdir/pairinteraction-$commit
  mkdir build
  cd build
  cmake ..
  make -j 8
}

package() {
#  cd "$srcdir/pairinteraction-$pkgver/build"
  cd "$srcdir/pairinteraction-$commit/build"
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps .
}
