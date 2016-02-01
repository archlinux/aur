# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-pyrsistent
pkgname=('python-pyrsistent' 'python2-pyrsistent')
pkgver=0.11.11
pkgrel=1
pkgdesc="Persistent/Functional/Immutable data structures"
arch=('i686' 'x86_64')
license=('MIT')
url="https://github.com/tobgu/pyrsistent"
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python-pytest-runner' 'python2-pytest-runner' 'python-hypothesis' 'python2-hypothesis')
source=("https://pypi.python.org/packages/source/p/pyrsistent/pyrsistent-$pkgver.tar.gz"
        LICENCE.mit)
sha512sums=('7edced0fbe57ad57aaff7d04dec79ed317d938e8e7369ff0d77dea9b1b097de74c794e19cbcdbb0144800ff7f6f491069a7726168b349f584d85bf3b27901695'
            '036bd5cc2a62b004576ecc50a84dc7d187d8108f52cb886f7e32bed324327af2dc132100e1c8f1dd2ce35b774f74898020f04a315e5137319deda18a449e791a')

prepare() {
  cp -a pyrsistent-$pkgver{,-py2}
}

build() {
  cd "$srcdir/pyrsistent-$pkgver"
  python setup.py build

  cd "$srcdir/pyrsistent-$pkgver-py2"
  python2 setup.py build
}

check() {
  cd "$srcdir/pyrsistent-$pkgver"
  python setup.py ptr || warning "Tests failed"

  cd "$srcdir/pyrsistent-$pkgver-py2"
  python2 setup.py ptr || warning "Tests failed"
}

package_python-pyrsistent() {
  depends=('python-six')

  cd pyrsistent-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1
  install -D -m644 ../LICENCE.mit "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE.mit"
}

package_python2-pyrsistent() {
  depends=('python2-six')

  cd pyrsistent-$pkgver-py2
  python2 setup.py install --root="${pkgdir}" --optimize=1
  install -D -m644 ../LICENCE.mit "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE.mit"
}
