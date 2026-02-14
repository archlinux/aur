# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-banal
_pkg="${pkgname#python-}"
pkgver=1.0.6
pkgrel=3
pkgdesc="Commons of banal micro-functions for Python."
license=('MIT')
arch=('any')
url="https://github.com/pudo/banal"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkg::1}/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('2fe02c9305f53168441948f4a03dfbfa2eacc73db30db4a93309083cb0e250a5')

latestver() {
	curl -fsSL "https://pypi.org/pypi/${_pkg}/json" | jq -r '.info.version'
}

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
