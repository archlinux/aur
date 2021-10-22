# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Batuhan Baserdem <lastname dot firstname at gmail>

pkgname=maestral-qt
pkgver=1.5.1
pkgrel=1
pkgdesc='Qt interface for Maestral'
arch=('any')
url="https://github.com/SamSchott/maestral-qt"
license=('MIT')
depends=(
	"maestral>=$pkgver"
	'python-click>=7.1.1'
	'python-markdown2'
	'python-packaging'
	'python-pyqt5>=5.9')
optdepends=('gnome-shell-extension-appindicator: Gnome integration')
makedepends=('python-setuptools' 'python-wheel')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('308b762238a1c68b07cc62f01ab50c3e3925b49812b50cb24eec2a232a6a7a93')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
  PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm 644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
