# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Yardena Cohen <yardenack@gmail.com>

pkgname=python-simple-crypt
_pkg="${pkgname#python-}"
pkgver=5.0.0.r7.gae19ce5
_commit=ae19ce570b285474cacf0acaaea514b08111501d
pkgrel=2
pkgdesc='Simple encryption and decryption for Python'
arch=('any')
url="https://github.com/KyleKing/simple-crypt"
license=('Unlicense')
depends=('python-pycryptodome')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz"
        'LICENSE')
sha256sums=('6312c536c5fdb29e8e0dade089158922429dbf6a5c88b6a3dd54d3fcf975dd91'
            '64462022dadbceb9425f25cfaeaeb64d24f3e5a50c8dbc85492e1c77c9c3bb43')

build() {
	cd "$_pkg-$_commit"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$_commit"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
