# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pyrsistent
pkgver=0.19.2
pkgrel=1
pkgdesc="Persistent/Functional/Immutable data structures"
arch=('x86_64')
license=('MIT')
url="https://github.com/tobgu/pyrsistent"
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-hypothesis')
source=("https://github.com/tobgu/pyrsistent/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('1b954e2621ffad03a8885abf69673d842669c0f69f26f33ef02353b7eb46dd966c8d56b208cbc9de3ed197218ef578221bb5bc389b14db7321224e7a21515f7e')

build() {
  cd pyrsistent-$pkgver
  python setup.py build
}

check() {
  cd pyrsistent-$pkgver
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-310" pytest
}

package() {
  cd pyrsistent-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.mit -t "$pkgdir"/usr/share/licenses/$pkgname/
}
