# Maintainer: Jeremy Gust <jeremy AT plasticsoup DOT net>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Batuhan Baserdem <lastname dot firstname at gmail>

pkgname=maestral-qt
pkgver=1.7.3
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
	'python-pyqt6'
	'qt6-svg')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('gnome-shell-extension-appindicator: Gnome integration')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fe9deb7905e33d6f19655c00d56ea4836fc5c0aa66dbda35db831fe64c225ea2')

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -dv "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sv "$_site/maestral_qt-$pkgver.dist-info/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
