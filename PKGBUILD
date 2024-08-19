# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=radian
pkgver=0.6.13
pkgrel=1
pkgdesc="A 21st century R console"
url="https://github.com/randy3k/radian"
arch=('i686' 'x86_64')
license=('MIT')
depends=('r>=3.4.0'
         'python-prompt_toolkit>3.0.41' 'python-prompt_toolkit<3.1'
         'python-rchitect>=0.4.7' 'python-rchitect<0.5.0')
makedepends=(python-build python-installer python-wheel python-setuptools)
checkdepends=(python-pytest python-pyte python-pexpect python-ptyprocess python-pytest-runner)
source=($pkgname-$pkgver.tar.gz::https://github.com/randy3k/radian/archive/v$pkgver.tar.gz)
sha256sums=('869173a954e085e2a829e31fe30f23d41910df33c7e49ae548c27d1f1c572ae3')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() { # may fail because of R profile
  cd "$srcdir/$pkgname-$pkgver"
  pytest
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
