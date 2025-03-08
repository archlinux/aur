# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-tmpl
_pkg=tmpl
pkgver=1.1.0
pkgrel=1
pkgdesc='Template abstraction for using multiple template engine backends'
arch=('any')
url="https://github.com/20c/tmpl"
license=('Apache')
depends=('python')
makedepends=('python-poetry-core' 'python-build' 'python-installer')
_checkdepends=('python-pytest' 'python-django' 'python-jinja')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('0a9215ebc6d4f12d60ea48e55428416af150984e1f4acbd71550cdca93e65d62')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}
# https://github.com/20c/tmpl/issues/15
_check() {
	cd "$_pkg-$pkgver"
	PYTHONPATH=./src pytest -x --disable-warnings
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
}
