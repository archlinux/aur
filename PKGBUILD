# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pyrsistent
pkgver=0.19.0
pkgrel=1
pkgdesc="Persistent/Functional/Immutable data structures"
arch=('x86_64')
license=('MIT')
url="https://github.com/tobgu/pyrsistent"
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-hypothesis')
source=("https://github.com/tobgu/pyrsistent/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('10cba127eb4667ce16eb6205f265a1e05c5e9f8df752dbac5726829f82860ef64fcbffee2ef750e5f38725dd6365acdae01a2f9884a511a5a5fb0ba28dc6abc1')

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
