# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_pkgname=dlib
pkgname=python-${_pkgname}-cuda-git
pkgver=19.24.6.r4.gfafdac3
pkgrel=1
pkgdesc="Dlib is a general purpose cross-platform C++ library designed using contract programming and modern C++ techniques. -- git CUDA version"
arch=('x86_64')
url="http://www.dlib.net/"
license=('BSL-1.0')
depends=('cblas' 'giflib' 'lapack' 'libjpeg-turbo' 'libpng' 'libx11' 'python' 'cuda' 'cudnn' 'libjxl')
makedepends=('git' 'boost' 'cmake' 'python-setuptools' 'sqlite' 'ccache-ext' 'gcc13' 'gcc13-libs')
optdepends=('sqlite')
provides=('python-dlib' 'python-dlib-cuda')
options=(!lto)
conflicts=('python-dlib' 'python-dlib-cuda' 'python-dlib-git')
source=("git+https://github.com/davisking/dlib.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
  cd "${_pkgname}"
  export CC=gcc-13 CXX=g++-13
	python setup.py build
}

package(){
	cd "${_pkgname}"
	python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
}
