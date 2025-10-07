# Maintainer: Jeremy Gust <jeremy AT plasticsoup DOT net>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Batuhan Baserdem <lastname dot firstname at gmail>
pkgname=maestral-qt
pkgver=1.9.5
pkgrel=1
pkgdesc='A Qt interface for the Maestral daemon'
arch=('any')
url="https://github.com/SamSchott/maestral-qt"
license=('MIT')
depends=("maestral"
         'python'
         'python-click'
         'python-markdown2'
         'python-packaging'
         'python-pyqt6'
         'python-pyro5'
         'qt6-svg')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('gnome-shell-extension-appindicator: Gnome integration')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('08fc70894fe896dd7478a991098c1d2ee11ae225795b853784a7e0241a2255a2')

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname-$pkgver"
	python -m installer --destdir="${pkgdir}/" dist/*.whl
	install -Dvm644 LICENSE.txt "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
