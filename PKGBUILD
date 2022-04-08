# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-tmpl
_pkg=tmpl
pkgver=1.0.0
pkgrel=1
pkgdesc='Template abstraction for using multiple template engine backends'
arch=('any')
url="https://github.com/20c/tmpl"
license=('Apache')
depends=('python')
makedepends=('python-poetry' 'python-build' 'python-installer')
checkdepends=('python-pytest' 'python-django' 'python-jinja')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('2922e51ffcf03f36caae2e1badf218596d9c19cb0a3069efb734ca85341acc4f')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pkg-$pkgver"
	PYTHONPATH=./src pytest -x --disable-warnings
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
}
