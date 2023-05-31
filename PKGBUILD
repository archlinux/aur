# Contributor: Patrick Mischke

pkgname='python-pairinteraction'
_name='pairinteraction'
_py="py3"
pkgver=0.9.8a0
pkgrel=5
pkgdesc="A Rydberg Interaction Calculator"
url="https://github.com/pairinteraction/pairinteraction"
depends=('python-numpy' 'python-scipy' 'python-pint' 'python-pyqtgraph' 'python-pyzmq' 'sqlite' 'gsl' 'swig' 'lapacke')
makedepends=('python-pip' 'doctest')
license=('GPL3' 'LGPL3')
arch=('x86_64')
options=('!buildflags' 'staticlibs' '!strip' 'libtool')
#source=("https://files.pythonhosted.org/packages/ef/49/1377fdf569cd2774f75688a9cd6524c6dc06a99a60249f659a0a2bcb8e6a/pairinteraction-0.9.8a0-py3-none-manylinux2014_x86_64.manylinux_2_17_x86_64.whl")
source=("https://github.com/pairinteraction/pairinteraction/archive/refs/heads/master.zip")

sha256sums=("SKIP")

build() {
  cd "$srcdir/pairinteraction-master"
  mkdir build
  cd build
  cmake ..
  make -j 8
}

package() {
  cd "$srcdir/pairinteraction-master/build"
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps .
}
