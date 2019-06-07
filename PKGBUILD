# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=radian
pkgver=0.4.0
pkgrel=1
pkgdesc="A 21 century R console"
url="https://github.com/randy3k/radian"
arch=('i686' 'x86_64')
license=('MIT')
depends=('r>=3.4.0' 'python-lineedit>=0.1.1' 'python-rchitect>=0.3.3' 'python-rchitect<0.4.0' 'python-six')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pyte' 'python-pexpect' 'python-ptyprocess')
replaces=('rtichoke')
source=("$pkgname-$pkgver.tar.gz::https://github.com/randy3k/radian/archive/v$pkgver.tar.gz")
sha256sums=('d4ae05ecdc6a4104583bb3dfa36c66af7bbada3d44b42d37f097d014f8d0c424')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

check_disabled() { # ImportMismatchError conftest.py
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py test
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
}
