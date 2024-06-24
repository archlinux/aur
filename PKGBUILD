# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=beetcamp
pkgdesc='Plugin for beets to use Bandcamp as an autotagger source'
pkgver=0.19.1
pkgrel=1
url=https://github.com/snejus/beetcamp
arch=(any)
license=(GPL2)
depends=(beets python-pycountry python-requests python-ordered-set)
makedepends=(python-build python-poetry)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('5ede5c846fa823cccc693ab4a886efc6e401f9c0f64002fc0923091c7884daa44d0532256acd6f3787673faf48f653889e4a01e97c293c6cd35e085f3a9c7e14')

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
