# Maintainer: jelle van der Waa <jelle@vdwaa.nl>
# Contributor: Felix Kaiser <felix.kaiser@fxkr.net>

pkgname=python-mock
pkgver=3.0.5
pkgrel=11
pkgdesc='Mocking and Patching Library for Testing'
url='http://www.voidspace.org.uk/python/mock/'
depends=('python' 'python-six' 'python-pbr')
license=('BSD')
arch=('any')
source=(mock-$pkgver.tar.gz::https://github.com/testing-cabal/mock/archive/$pkgver.tar.gz)
sha512sums=('9ab4f0c794f5701ba1367d982cf79a5662d4233753d12ed9c88ae20282db1f44be73f84c4d9f6d03ff64926b8c1b6d0c9a79b2a4724a3eb36c247ffd4ab03e2d')

prepare() {
  cd "$srcdir/mock-$pkgver"
  # use unittest instead of unittest2 as they are the same on recent python*
  sed -i 's/unittest2/unittest/g' mock/tests/*.py
}

build() {
  cd "$srcdir/mock-$pkgver"
  python3 setup.py build
}

check() {
  cd "$srcdir/mock-$pkgver"
  echo 'python tests'
  python -m unittest discover
}

package() {
  cd "$srcdir/mock-$pkgver"
  python3 setup.py install --optimize=1 --root="$pkgdir"
  install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
