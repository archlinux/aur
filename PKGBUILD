# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-compreffor
_pyname=${pkgname#python-}
pkgver=0.5.3
pkgrel=1
pkgdesc='A CFF table suroutinizer for FontTools'
arch=(x86_64)
url="https://github.com/googlefonts/$_pyname"
license=(Apache)
depends=(python
         python-fonttools)
makedepends=(cython
             python-setuptools-git-ls-files
             python-setuptools-scm
             python-wheel)
checkdepends=(python-pytest)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('7d41296d4fb0aa1ef696dfd925d2af3227d4030622be99b3c7d4107dc6f8713a')

build() {
	cd "$_archive"
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
