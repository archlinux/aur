# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Batuhan Baserdem <lastname dot firstname at gmail>

pkgname=maestral-qt
pkgver=1.5.3
pkgrel=1
pkgdesc='Qt interface for Maestral'
arch=('any')
url="https://github.com/SamSchott/maestral-qt"
license=('MIT')
depends=(
	"maestral>=$pkgver"
	'python-click'
	'python-markdown2'
	'python-packaging'
	'python-pyqt5')
optdepends=('gnome-shell-extension-appindicator: Gnome integration')
makedepends=('python-build' 'python-install' 'python-wheel')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d8f85c1cc3e5449f494c81f490997d6b4c300c3829b7a4ee5c1841cdc718a3f5')

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
	export PYTHONHASHSEED=0
	cd "$pkgname-$pkgver"
	python -m install --optimize=1 --destdir="$pkgdir/" dist/*.whl
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
