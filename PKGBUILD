# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=radian
pkgver=0.6.9
pkgrel=1
pkgdesc="A 21 century R console"
url="https://github.com/randy3k/radian"
arch=('i686' 'x86_64')
license=('MIT')
depends=('r>=3.4.0'
         'python-prompt_toolkit>3.0.15' 'python-prompt_toolkit<3.1'
         'python-rchitect>=0.4.3' 'python-rchitect<0.5.0')
makedepends=('python-setuptools' 'python-pip')
checkdepends=('python-pytest' 'python-pyte' 'python-pexpect' 'python-ptyprocess')
replaces=('rtichoke')
source=($pkgname-$pkgver.tar.gz::https://github.com/randy3k/radian/archive/v$pkgver.tar.gz)
sha256sums=('f8b402f63f953a9a740c53d50b40a131a23482947fa1b9a929cfec26ac1f9b6b')

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
