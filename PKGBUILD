# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pyrsistent
pkgver=0.19.3
pkgrel=1
pkgdesc="Persistent/Functional/Immutable data structures"
arch=('x86_64')
license=('MIT')
url="https://github.com/tobgu/pyrsistent"
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-hypothesis')
source=("https://github.com/tobgu/pyrsistent/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('045d9ca4a2a5c5525887fbbcae77b2bc0271e6a596686ad6281c74fb1f6c8d8a4b0c9444cbd951900d953c61d51cf9452290f1e63e9107f7828bfea6e6b34545')

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
