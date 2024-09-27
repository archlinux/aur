# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-ufo-extractor
_pyname=${pkgname#python-}
_upname=${_pyname#ufo-}
pkgver=0.8.0
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
sha256sums=('1f93924527b8c7611ff74d93d9df30468a0f2753c5c0b974198250ed9fe31901')

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
