# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=picosvg
pkgver=0.20.6
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
makedepends=(python-{build,installer,wheel}
             python-setuptools-scm)
checkdepends=(python-pytest)
_archive="$pkgname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$_archive.tar.gz")
sha256sums=('c4f6c46b9bc8d076e7a081ff88b43edc968364e5024429d3f6f305c765c0d682')

build() {
	cd "$_archive"
	python -m build -wn
}

check() {
	cd "$_archive"
	PYTHONPATH=src pytest tests
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
