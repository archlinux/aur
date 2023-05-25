# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=picosvg
pkgver=0.21.0
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
sha256sums=('6e645815dc07ac4943ccf21af6104f7372f786b0056112444c16a0c8f860ccea')

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
