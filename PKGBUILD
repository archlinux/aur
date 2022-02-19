# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Batuhan Baserdem <lastname dot firstname at gmail>

pkgname=python-bugsnag
pkgver=4.2.0
pkgrel=1
pkgdesc='Official bugsnag error monitoring and error reporting for various python apps.'
arch=('any')
url='https://github.com/bugsnag/bugsnag-python'
license=('MIT')
depends=('python-webob')
optdepends=(
	'python-flask: Flask integration'
	'python-blinker: Flask integration')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c8bf852972054deed2026866c4b7b6cc6c64ae306b370c885ecf4995a72f5897')

build() {
	cd "bugsnag-python-$pkgver"
	python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
	export PYTHONHASHSEED=0
	cd "bugsnag-python-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 UPGRADING.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
