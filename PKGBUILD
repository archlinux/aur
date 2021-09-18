# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=picosvg
pkgver=0.18.3
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
sha256sums=('aac10456420815c25b4356e56977c11710d92fe817118fe8bb0cc4684023fec9')

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
