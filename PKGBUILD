# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-ufo-extractor
_pyname=${pkgname#python-}
_upname=${_pyname#ufo-}
pkgver=0.4.2
pkgrel=1
pkgdesc='Tools for extracting data from font binaries into UFO objects'
url="https://github.com/robotools/$_upname"
arch=(any)
license=(MIT)
depends=(python
         python-fonttools)
makedepends=(python-setuptools-scm)
checkdepends=(python-pytest-runner)
_archive="${_pyname/-/_}-$pkgver"
source=("$_archive.tgz::$url/archive/$pkgver.tar.gz")
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.zip")
sha256sums=('11adfa59972af28403298c59ea318a10121bf7279be34f058a747e764572fd26')

build() {
	cd "$_archive"
	python setup.py build
}

check() {
	cd "$_archive"
	python setup.py test
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
