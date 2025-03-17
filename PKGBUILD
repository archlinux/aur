# Contributor: Patrick Mischke

pkgname='python-pairinteraction'
_name='pairinteraction'
_py="py3"
pkgver=1.4.3
commit="0fb667a7c7373594f55fbd0ccdcf5a6abffa5532"
pkgrel=1
pkgdesc="A Rydberg Interaction Calculator"
url="https://github.com/pairinteraction/pairinteraction"
depends=('python-typing_extensions' 'python-numpy' 'python-scipy' 'python-pint' 'python-colorama' 'pyside6' 'python-matplotlib' 'python-mplcursors' 'python' 'intel-oneapi-mkl' 'python-mkl' 'nlohmann-json')
makedepends=('cmake' 'python-scikit-build-core' 'nanobind' 'python-pip')
license=('GPL-3.0-only' 'LGPL-3.0-only')
arch=('x86_64')
options=('!buildflags' 'staticlibs' '!strip' 'libtool')
# every once in a while an actual release is build and we can grab that
# source=("https://github.com/pairinteraction/pairinteraction/archive/refs/tags/v$pkgver.tar.gz")
# for now we just use the zip of whatever commit I updated this last
source=("https://github.com/pairinteraction/pairinteraction/archive/$commit.zip")

sha256sums=("06a6f0a97eb3d0eff70b32a639c4ba600d0fbc7cea36afa9fbad78828fc096ff")

build() {
#  cd $srcdir/pairinteraction-$pkgver
  cd $srcdir/pairinteraction-$commit
  mkdir build
  cd build
  cmake ..
  cmake --build . -j 8
}

package() {
#  cd "$srcdir/pairinteraction-$pkgver/build"
  cd "$srcdir/pairinteraction-$commit"
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps .
}

#check() {
#  pairinteraction test
#}
