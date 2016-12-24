# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-salsa20
pkgname=("python-salsa20" "python2-salsa20")
pkgver=0.3.0
pkgrel=4
pkgdesc='Bindings for the NaCL implementation of Salsa20 and XSalsa20 by D. J. Bernstein'
arch=('i686' 'x86_64')
url="http://github.com/keybase/python-salsa20"
license=('BSD')
makedepends=('python' 'python2')
source=("https://pypi.python.org/packages/source/s/salsa20/salsa20-$pkgver.tar.gz")
md5sums=('5f199f3d6c643f05904b9d4a0b5d7e00')

prepare() {
  cp -a "salsa20-$pkgver"{,-py2}
}

build() {
  cd salsa20-$pkgver
  python setup.py build

  cd ../salsa20-$pkgver-py2
  python2 setup.py build
}

check() {
  cd salsa20-$pkgver
  PYTHONPATH="$(pwd)/build/lib.linux-$CARCH-3.6:$PYTHONPATH" python -m doctest -v README.rst

  cd ../salsa20-$pkgver-py2
  PYTHONPATH="$(pwd)/build/lib.linux-$CARCH-2.7:$PYTHONPATH" python2 -m doctest -v README.rst
}

package_python-salsa20() {
  depends=('python')

  cd salsa20-$pkgver
  python3 setup.py install --root="${pkgdir}" --skip-build --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-salsa20() {
  depends=('python2')

  cd salsa20-$pkgver-py2
  python2 setup.py install --root="${pkgdir}" --skip-build --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
