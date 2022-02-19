# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=blacktex
pkgver=0.6.0
pkgrel=1
pkgdesc="LaTex code prettifier and formatter"
arch=('any')
url="https://github.com/nschloe/blacktex"
license=('GPL3')
depends=('python-pylatexenc')
optdepends=('python-importlib-metadata: required for python<3.8')
makedepends=('python-build' 'python-installer' 'python-flit-core')
checkdepends=('python-pytest' 'python-pytest-randomly')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1f062793b39e85255e1a43fe87d6ac75170dc4145706d4d863cb115a42542aa2')

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
	cd "$pkgname-$pkgver"
	PYTHONPATH=./src pytest -x
}

package() {
	export PYTHONHASHSEED=0
	cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
