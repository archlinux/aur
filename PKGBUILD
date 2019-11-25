# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=radian
pkgver=0.4.2
pkgrel=1
pkgdesc="A 21 century R console"
url="https://github.com/randy3k/radian"
arch=('i686' 'x86_64')
license=('MIT')
depends=('r>=3.4.0' 'python-six'
         'python-lineedit>=0.1.3' 'python-lineedit<0.2.0'
         'python-rchitect>=0.3.12' 'python-rchitect<0.4.0')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pyte' 'python-pexpect' 'python-ptyprocess')
replaces=('rtichoke')
source=($pkgname-$pkgver.tar.gz::https://github.com/randy3k/radian/archive/v$pkgver.tar.gz)
sha256sums=('d902e7cdad60494d5dbfdfae28204fac50c516ac94f03d70389f140df935ffd3')

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
