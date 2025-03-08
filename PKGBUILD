# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-vodka
_pkg=vodka
pkgver=3.2.0.1
pkgrel=1
pkgdesc='plugin based real-time web service daemon'
arch=('any')
url="https://github.com/20c/vodka"
license=('Apache')
depends=('python-click' 'python-munge' 'python-pluginmgr' 'python-tmpl' 'python-setuptools')
makedepends=('python-poetry-core' 'python-build' 'python-installer')
_checkdepends=('python-pytest' 'python-flask' 'python-django')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('4a7d216e628d78622c5afb4e6d87df3cfdb564bc0103d3b61971cddc7cbb6528')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

_check() {
	cd "$_pkg-$pkgver"
	PYTHONPATH=./src pytest -x --disable-warnings
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 docs/*.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
