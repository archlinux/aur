# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-pyrsistent
pkgname=('python-pyrsistent' 'python2-pyrsistent')
pkgver=0.14.3
pkgrel=1
pkgdesc="Persistent/Functional/Immutable data structures"
arch=('x86_64')
license=('MIT')
url="https://github.com/tobgu/pyrsistent"
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python-pytest-runner' 'python2-pytest-runner' 'python-hypothesis' 'python2-hypothesis')
source=("https://pypi.io/packages/source/p/pyrsistent/pyrsistent-$pkgver.tar.gz"
        LICENCE.mit)
sha512sums=('3282fd34d5a6c5ca38c18c0e46d8bd111968b69f5c63b2265ddea0a1884255f19498a0e6a58430accc2db623348520eb8b9ded20daf6bd5e9abb222e4886a2fb'
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
