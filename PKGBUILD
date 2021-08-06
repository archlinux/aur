# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-compreffor
_pyname=${pkgname#python-}
pkgver=0.5.1
pkgrel=1
pkgdesc='A CFF table suroutinizer for FontTools'
arch=(x86_64)
url="https://github.com/googlefonts/$_pyname"
license=(Apache)
depends=(python
         python-fonttools)
makedepends=(cython
             python-setuptools)
checkdepends=(python-pytest)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.zip")
sha256sums=('5ee371aea1ba2db13884e2dec9a7bd2a51f87a9d06085e9321f58e5bde94c6c3')

build() {
	cd "$_archive"
	export PYTHONHASHSEED=0
	python setup.py build_ext --inplace
	python setup.py build
}

check() {
	cd "$_archive/src/python"
	PYTHONPATH=. pytest compreffor/test
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
