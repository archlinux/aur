# Maintainer: Fantix King <fantix.king@gmail.com>
pkgname=python-edgedb
pkgver=0.24.0
pkgrel=1
pkgdesc="EdgeDB Python driver"
arch=('x86_64')
url="https://github.com/edgedb/edgedb-python"
license=('Apache')
depends=('python>=3.7')
makedepends=('python-build' 'python-installer' 'python-setuptools>=42' 'python-wheel' 'cython>=0.29.24' 'cython<0.30.0')
_pgproto="1720f8af63725d79454884cfa787202a50eb5430"
source=("https://github.com/edgedb/edgedb-python/archive/refs/tags/v${pkgver}.zip"
	"https://github.com/MagicStack/py-pgproto/archive/${_pgproto}.zip")
sha256sums=('5cdf1f0534f1373d5b3ab16526eaf807830443703db9fc7310dbc3a27911fca3'
            '365c610cdcea2b064f9dc445e0f3a1b0d19db94a680d89ef868768878c97ecf2')
prepare() {
	cd "edgedb-python-$pkgver"
	rmdir "edgedb/pgproto/"
	ln -s "$srcdir/py-pgproto-$_pgproto" "edgedb/pgproto"
}

build() {
	cd "edgedb-python-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "edgedb-python-$pkgver"
}

package() {
	cd "edgedb-python-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
