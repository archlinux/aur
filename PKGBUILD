# Maintainer: Jeremy Gust <jeremy AT plasticsoup DOT net>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Batuhan Baserdem <lastname dot firstname at gmail>
pkgname=maestral-qt
pkgver=1.9.4
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
sha256sums=('73aec2ec2fadb32333bb81ca50895c14eaf6f0aa5c5306c45c0c0e2a14660ecb')

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname-$pkgver"
	python -m installer --destdir="${pkgdir}/" dist/*.whl
	install -Dvm644 LICENSE.txt "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
