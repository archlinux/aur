# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=beetcamp
pkgdesc='Plugin for beets to use Bandcamp as an autotagger source'
pkgver=0.17.2
pkgrel=1
url=https://github.com/snejus/beetcamp
arch=(any)
license=(GPL2)
depends=(beets python-pycountry python-requests python-ordered-set)
makedepends=(python-build python-poetry)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('2fe07d326f48123f8bb20d6c29e4bbff61ec5286bd59f736a46b7e6a4720d50e96b2fd59d5d706203e1c11bfdde278d2759969baf01ea03d5136cb859e85f93e')

prepare () {
	cd "$pkgname-$pkgver"
	poetry install
}

build () {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

check () {
	cd "$pkgname-$pkgver"
	poetry run pytest -k 'not need_connection' --ignore-glob='*test_lib*'
}

package () {
	cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
