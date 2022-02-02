# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=python-zimports
pkgver=0.4.4
pkgrel=1
pkgdesc="Python import rewriter"
arch=('any')
url="https://github.com/sqlalchemyorg/zimports"
license=('MIT')
depends=('python>=3.7' 'python-pyflakes' 'python-flake8-import-order')
makedepends=('python-setuptools' 'python-build' 'python-install' 'python-wheel')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f8b6d4e2b81738d5f41783c22095b2ea2d2921820fa852764b1d9ee8e8bcb9ef')

build() {
	cd "zimports-$pkgver"
	python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
	cd "zimports-$pkgver"
	pytest -x
}

package() {
	export PYTHONHASHSEED=0
	cd "zimports-$pkgver"
	python -m install --optimize=1 --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
