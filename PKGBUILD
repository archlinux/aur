# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Batuhan Baserdem <lastname dot firstname at gmail>

pkgname=maestral-qt
pkgver=1.6.0
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
	'python-pyqt6')
optdepends=('gnome-shell-extension-appindicator: Gnome integration')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('3814d0d8d9c16a9b584f6a26ac4c12f1a7332e85732b320ed2f14bd4702b7641')

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	export PYTHONHASHSEED=0
	cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl

	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s \
		"$_site/maestral_qt-$pkgver.dist-info/LICENSE.txt" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
