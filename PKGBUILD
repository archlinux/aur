# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pyname=pydyf
pkgname=python-$_pyname
pkgver=0.1.0
pkgrel=1
pkgdesc='a low-level PDF generator written in Python and based on PDF specification 1.7'
arch=(any)
url="https://www.courtbouillon.org/$_pyname"
license=(BSD)
depends=(python
         python-sphinx_rtd_theme)
makedepends=(python-setuptools
             python-sphinx)
checkdepends=(ghostscript
              python-pillow
              python-pytest)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('1764773ff01d71f941497d6dd32a21b87baf5b98f86cd47965ac33f3eb64c127')

prepare() {
	cd "$_archive"
	# We don't want any of the special pytest options injected
	sed -i -e '/^addopts/d' pyproject.toml
}

build() {
	cd "$_archive"
	python setup.py build
}

check() {
	cd "$_archive"
	pytest
}

package() {
	cd "$_archive"
	export PYTHONHASHSEED=0
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
