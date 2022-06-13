# Maintainer: ibrokemypie <ibrokemypie@bastardi.net>
pkgname=python-oead
_name=${pkgname#python-}
pkgver=1.2.4.2
pkgrel=1
pkgdesc="Library for recent Nintendo EAD formats in first-party games"
arch=('any')
url="https://github.com/zeldamods/oead"
license=('GPL2')
depends=('python')
makedepends=('python-wheel' 'python-build' 'python-installer' 'cmake' 'git' 'gcc')
source=("git+https://github.com/zeldamods/oead#tag=v1.2.4-2")
sha256sums=('SKIP')

# python-oead will not build with clang
export CC=gcc
export CXX=g++

prepare() {
	cd "${srcdir}/${_name}"
	git submodule update --init --recursive
}

build() {
	cd "${srcdir}/${_name}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_name}"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
