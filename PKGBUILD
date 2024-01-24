# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=radian
pkgver=0.6.11
pkgrel=1
pkgdesc="A 21 century R console"
url="https://github.com/randy3k/radian"
arch=('i686' 'x86_64')
license=('MIT')
depends=('r>=3.4.0'
         'python-prompt_toolkit>3.0.41' 'python-prompt_toolkit<3.1'
         'python-rchitect>=0.4.6' 'python-rchitect<0.5.0')
makedepends=('python-setuptools' 'python-pip')
checkdepends=('python-pytest' 'python-pyte' 'python-pexpect' 'python-ptyprocess')
replaces=('rtichoke')
source=($pkgname-$pkgver.tar.gz::https://github.com/randy3k/radian/archive/v$pkgver.tar.gz)
sha256sums=('7539fcfbacdc49422b4580475e3f2dc893bb51277bf5265e44f5d8295d04a618')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

check_disabled() { # may fail because of R profile
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py test
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
}
