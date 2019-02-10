# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Michal Krenek (Mikos) <m.krenek@gmail.com>

pkgname=python-qt.py
_pkgname=Qt.py
pkgver=1.2.0.b2
pkgrel=4
pkgdesc="Python compatibility wrapper around all Qt bindings"
arch=('any')
url="https://github.com/mottosso/Qt.py"
license=('MIT')
depends=('python')
optdepends=('python-pyqt5: Qt 5 bindings'
	    'pyside2: LGPL Qt 5 bindings')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('b4ca3b96bc3773b1affbeb42bc72a53ff21414a3f70a7aeec3faf03883d84380')

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

