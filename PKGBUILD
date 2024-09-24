# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-ufo-extractor
_pyname=${pkgname#python-}
_upname=${_pyname#ufo-}
pkgver=0.7.0
pkgrel=1
pkgdesc='Tools for extracting data from font binaries into UFO objects'
url="https://github.com/robotools/$_upname"
arch=(any)
license=(MIT)
depends=(python
         python-fonttools)
makedepends=(python-{build,installer,wheel}
             python-setuptools-scm)
checkdepends=(python-pytest)
_archive="${_pyname/-/_}-$pkgver"
source=("$url/archive/$pkgver/$_archive.tar.gz")
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.zip")
sha256sums=('159413a247c4f6a6f6c2b362e3c65f589991f1a9a38abe1789c5b3d57822487f')

build() {
	cd "$_archive"
	python -m build -wn
}

check() {
	cd "$_archive"
	pytest
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
