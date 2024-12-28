# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-ufo-extractor
_pyname=${pkgname#python-}
_upname=${_pyname#ufo-}
pkgver=0.8.1
pkgrel=2
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
sha256sums=('e4c2ba3458dcc0ee203a3a16d886f3736e50c36b5a4e906b97e5dcc486e1863d')

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
