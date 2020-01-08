# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-pyrsistent
pkgname=('python-pyrsistent' 'python2-pyrsistent')
pkgver=0.15.7
pkgrel=1
pkgdesc="Persistent/Functional/Immutable data structures"
arch=('x86_64')
license=('MIT')
url="https://github.com/tobgu/pyrsistent"
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python-pytest-runner' 'python2-pytest-runner' 'python-hypothesis' 'python2-hypothesis')
source=("https://pypi.io/packages/source/p/pyrsistent/pyrsistent-$pkgver.tar.gz"
        LICENCE.mit)
sha512sums=('ebd6f4479d3583fc2678c881eedc97889b1e3ef2f0cb8a60d241d5306cc8c2907e3aa50a19f47fb37565794903dc1c823dbf6c3813a93d2e851cb694daa535e3'
            '036bd5cc2a62b004576ecc50a84dc7d187d8108f52cb886f7e32bed324327af2dc132100e1c8f1dd2ce35b774f74898020f04a315e5137319deda18a449e791a')

prepare() {
  sed -i 's/<5//g' pyrsistent-$pkgver/setup.py
  cp -a pyrsistent-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/pyrsistent-$pkgver
  python setup.py build

  cd "$srcdir"/pyrsistent-$pkgver-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/pyrsistent-$pkgver
  python setup.py pytest

  cd "$srcdir"/pyrsistent-$pkgver-py2
  python2 setup.py pytest
}

package_python-pyrsistent() {
  depends=('python-six')

  cd pyrsistent-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 ../LICENCE.mit "$pkgdir"/usr/share/licenses/$pkgname/LICENCE.mit
}

package_python2-pyrsistent() {
  depends=('python2-six')

  cd pyrsistent-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 ../LICENCE.mit "$pkgdir"/usr/share/licenses/$pkgname/LICENCE.mit
}
