# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-vodka
_pkg=vodka
pkgver=3.2.0
pkgrel=1
pkgdesc='plugin based real-time web service daemon'
arch=('any')
url="https://github.com/20c/vodka"
license=('Apache')
depends=('python-click' 'python-munge' 'python-pluginmgr' 'python-tmpl')
makedepends=('python-poetry' 'python-build' 'python-installer')
checkdepends=('python-pytest' 'python-flask' 'python-django')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('8e2f8ac08ba26bbcbfcdb435ca87ddf86b6101a812e137b24b637f15c44ed646')

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
	install -Dm644 docs/*.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
