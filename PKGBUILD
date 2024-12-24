# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_pkgname=dlib
pkgname=python-${_pkgname}-git
pkgver=19.24.6.r4.gfafdac3
pkgrel=2
pkgdesc="Dlib is a general purpose cross-platform C++ library designed using contract programming and modern C++ techniques. -- git non-CUDA version"
arch=('x86_64')
url="http://www.dlib.net/"
license=('BSL-1.0')
depends=('cblas' 'giflib' 'lapack' 'libjpeg-turbo' 'libpng' 'python' 'ffmpeg')
makedepends=('git' 'boost' 'cmake' 'python-setuptools' 'sqlite')
optdepends=('sqlite')
provides=('python-dlib')
conflicts=('python-dlib' 'python-dlib-cuda')
source=("git+https://github.com/davisking/dlib.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
	cd "${_pkgname}"
	python setup.py build --no DLIB_USE_CUDA
}

package(){
	cd "${_pkgname}"
	python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
}
