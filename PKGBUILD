# Contributor: Patrick Mischke

pkgname='python-pairinteraction'
_name='pairinteraction'
_py="py3"
pkgver=0.9.8a0
pkgrel=2
pkgdesc="A Rydberg Interaction Calculator"
url="https://github.com/pairinteraction/pairinteraction"
depends=('python-numpy' 'python-scipy' 'python-pint' 'python-psutil' 'python-pyqtgraph' 'python-pyzmq' 'sqlite' 'gsl' 'swig')
makedepends=('python-pip' 'doctest')
license=('GPL3' 'LGPL3')
arch=('x86_64')
options=('!buildflags' 'staticlibs' '!strip' 'libtool')
#source=("https://files.pythonhosted.org/packages/ef/49/1377fdf569cd2774f75688a9cd6524c6dc06a99a60249f659a0a2bcb8e6a/pairinteraction-0.9.8a0-py3-none-manylinux2014_x86_64.manylinux_2_17_x86_64.whl")
source=("https://github.com/pairinteraction/pairinteraction/archive/refs/heads/master.zip")
#sources=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/$name-$pkgver-$_py-none-manylinux2010_x86_64.whl")

sha256sums=('4537da3806c20fbcd5a71686c8b50131d9704cb77e18792e1a84c03efb40ac10')
#sha256sums=('bba4a49b52e038d461d7a511d605fe22ac3dcbbe41ad3225f2dd3e86aa91a587')

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
