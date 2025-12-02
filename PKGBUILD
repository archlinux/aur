# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_pkgname=dlib
pkgname=python-${_pkgname}-git
pkgver=20.0.r29.g49b7cba
pkgrel=1
pkgdesc="Dlib is a general purpose cross-platform C++ library designed using contract programming and modern C++ techniques. -- git non-CUDA version"
arch=('x86_64')
url="http://www.dlib.net/"
license=('BSL-1.0')
depends=('cblas' 'giflib' 'lapack' 'libjpeg-turbo' 'libpng' 'python' 'ffmpeg')
makedepends=('git' 'boost' 'cmake' 'python-setuptools' 'sqlite' 'python-build' 'python-installer' 'python-wheel')
optdepends=('sqlite')
provides=('python-dlib')
conflicts=('python-dlib' 'python-dlib-cuda')
source=("git+https://github.com/davisking/dlib.git")
b2sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
	cd "${_pkgname}"
	DLIB_USE_CUDA=OFF python -m build --wheel --no-isolation
}

package(){
	cd "${_pkgname}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
}
