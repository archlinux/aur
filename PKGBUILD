# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-salsa20
pkgver=0.3.0
pkgrel=6
pkgdesc='Bindings for the NaCL implementation of Salsa20 and XSalsa20 by D. J. Bernstein'
arch=('x86_64')
url="https://github.com/keybase/python-salsa20"
license=('BSD')
depends=('python')
source=("https://pypi.python.org/packages/source/s/salsa20/salsa20-$pkgver.tar.gz")
sha512sums=('3d899744aca4f96fa1d0fb244988dc1bfc04fcbe93036c1cc643640cd6229976b9161ab1e197ca7f1cc098af622ddfc7a1a9e43da7d66915adce6247802d5736')

build() {
  cd salsa20-$pkgver
  python setup.py build
}

check() {
  cd salsa20-$pkgver
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-3.7:$PYTHONPATH" python -m doctest -v README.rst
}

package() {
  cd salsa20-$pkgver
  python setup.py install --root="$pkgdir" --skip-build --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
