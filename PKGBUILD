# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Batuhan Baserdem <lastname dot firstname at gmail>

pkgname=maestral-qt
pkgver=1.5.2
pkgrel=1
pkgdesc='Qt interface for Maestral'
arch=('any')
url="https://github.com/SamSchott/maestral-qt"
license=('MIT')
depends=(
	"maestral=$pkgver"
	'python-click'
	'python-markdown2'
	'python-packaging'
	'python-pyqt5')
optdepends=('gnome-shell-extension-appindicator: Gnome integration')
makedepends=('python-setuptools' 'python-wheel')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('5decf5f44f52771be7c5559e5b0db777fcd02704b5a116ebfdd55b779475b5dd')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
  PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm 644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
