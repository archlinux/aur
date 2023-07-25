# Maintainer: Jeremy Gust <jeremy AT plasticsoup DOT net>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Batuhan Baserdem <lastname dot firstname at gmail>

pkgname=maestral-qt
pkgver=1.8.0
pkgrel=1
pkgdesc='A Qt interface for the Maestral daemon'
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
sha256sums=('ffc450c03e4d306adb5a859a074227386505161c1a08f6f6b9bfa01d66251c28')

build() {
   cd "$pkgname-$pkgver"
   python -m build --wheel --no-isolation
}

package() {
   cd "$pkgname-$pkgver"
   python -m installer --destdir="$pkgdir/" dist/*.whl
   local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
   install -dvm664 "$pkgdir/usr/share/licenses/$pkgname/"
   ln -sv "$_site/maestral_qt-$pkgver.dist-info/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
