# Maintainer: ibrokemypie <ibrokemypie@bastardi.net>
pkgname=python-oead
_name=${pkgname#python-}
pkgver=1.2.3
pkgrel=2
pkgdesc="Library for recent Nintendo EAD formats in first-party games"
arch=('any')
url="https://github.com/zeldamods/oead"
license=('GPL2')
depends=('python')
makedepends=('python-setuptools' 'cmake' 'git' 'gcc')
source=("git+https://github.com/zeldamods/oead#tag=v${pkgver}")
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
	python setup.py build
}

package() {
	cd "${srcdir}/${_name}"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
