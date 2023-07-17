# Maintainer: Fantix King <fantix.king@gmail.com>
pkgname=python-edgedb
pkgver=1.3.0
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
sha256sums=('e0f375ceffd7b981a2ad1e149f80412acfd4e70be29bc8e74cf3e1af4ddd9a1f'
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
