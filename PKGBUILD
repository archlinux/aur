# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=radian
pkgver=0.3.2
pkgrel=1
pkgdesc="A 21 century R console"
url="https://github.com/randy3k/radian"
arch=('i686' 'x86_64')
license=('MIT')
depends=('r>=3.4.0' 'python-lineedit>=0.1.1' 'python-rchitect>=0.2.3' 'python-six')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pyte' 'python-pexpect' 'python-ptyprocess')
replaces=('rtichoke')
source=("$pkgname-$pkgver.tar.gz::https://github.com/randy3k/radian/archive/v$pkgver.tar.gz")
sha256sums=('2e3daf8a9fe579995a69c1bdaec5c6a0ffccc3372e15376b4a4a811e2b4b814e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

check_disabled() { # ImportError: '_true' from 'prompt_toolkit.shortcuts.prompt'
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py test
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
}
