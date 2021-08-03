# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=picosvg
pkgver=0.18.1
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
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('eefc54bc29216941fb48a08aa84cd569041c7fe9de9a46105e29d8f36308ef23')

build() {
	cd "$pkgname-$pkgver"
	export PYTHONHASHSEED=0
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
