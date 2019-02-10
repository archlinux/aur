# Maintainer: Michael Lass <bevan@bi-co.net>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Michal Krenek (Mikos) <m.krenek@gmail.com>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=python-qt.py
_pkgname=Qt.py
pkgver=1.2.0.b3
pkgrel=1
pkgdesc="Python compatibility wrapper around all Qt bindings"
arch=('any')
url="https://github.com/mottosso/Qt.py"
license=('MIT')
depends=('python')
optdepends=('python-pyqt5: Qt 5 bindings'
	    'pyside2: LGPL Qt 5 bindings')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('60ae09c93a750ce215881c72239dbfdfec7ea68db42f5cff20677e672bfc8fca')

build() {
  cd "$srcdir"/$_pkgname-$pkgver
  python setup.py build
}

package() {
  cd "$srcdir"/$_pkgname-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  rm "$pkgdir"/usr/LICENSE # Weird

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
