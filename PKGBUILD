# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=python-zimports
pkgver=0.5.0
pkgrel=1
pkgdesc="Python import rewriter"
arch=('any')
url="https://github.com/sqlalchemyorg/zimports"
license=('MIT')
depends=('python>=3.7' 'python-pyflakes' 'python-flake8-import-order' 'python-tomli')
makedepends=('python-setuptools' 'python-build' 'python-install' 'python-wheel')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('0fdedf4d796e9e4d05b4bc2a3494984a1359d9b8ab7036472ac175999f6bc5a9')

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
