# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-pyrsistent
pkgname=('python-pyrsistent' 'python2-pyrsistent')
pkgver=0.14.8
pkgrel=1
pkgdesc="Persistent/Functional/Immutable data structures"
arch=('x86_64')
license=('MIT')
url="https://github.com/tobgu/pyrsistent"
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python-pytest-runner' 'python2-pytest-runner' 'python-hypothesis' 'python2-hypothesis')
source=("https://pypi.io/packages/source/p/pyrsistent/pyrsistent-$pkgver.tar.gz"
        LICENCE.mit)
sha512sums=('16981bc6f0f1e30c438ed83bd2636b3a8a56ffe5d61430f29278aa7d29f9dd9318955a05898e1d0a2232fccf88ec1238c6a254f9356b0058e4d00b99073fa0af'
            '036bd5cc2a62b004576ecc50a84dc7d187d8108f52cb886f7e32bed324327af2dc132100e1c8f1dd2ce35b774f74898020f04a315e5137319deda18a449e791a')

prepare() {
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
