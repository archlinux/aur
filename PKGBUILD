# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=picosvg
pkgver=0.18.4
pkgrel=1
pkgdesc='CLI tool to simplify SVG files, intended for use as part of a font build'
arch=(any)
url="https://github.com/googlefonts/$pkgname"
license=(Apache)
_py_deps=(lxml
          skia-pathops)
depends=(absl-py
         python
         "${_py_deps[@]/#/python-}")
makedepends=(python-setuptools-scm)
checkdepends=(python-pytest)
_archive="$pkgname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$_archive.tar.gz")
sha256sums=('c48cf3f67d092fdc7b9813888df73767ec1176dda383c8f546480a3f3caba606')

build() {
	cd "$_archive"
	export PYTHONHASHSEED=0
	python setup.py build
}

check() {
	cd "$_archive"
	PYTHONPATH=src pytest tests
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
