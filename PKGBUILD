# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-banal
_pkg="${pkgname#python-}"
pkgver=1.1.2
pkgrel=1
pkgdesc="Commons of banal micro-functions for Python."
license=('MIT')
arch=('any')
url="https://github.com/pudo/banal"
depends=('python')
makedepends=('python-build' 'python-hatchling' 'python-installer')
source=("$_pkg-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('4fa13afa462b7c601163fd5fa970c51ee24ebc8291c3fbc0598bdf2c2ed18a68')

latestver() {
	curl -fsSL "https://pypi.org/pypi/${_pkg}/json" | jq -r '.info.version'
}

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
