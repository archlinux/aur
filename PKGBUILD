# Maintainer: Damir Jelić <poljar@termina.org.uk>

pkgbase=python-olm
pkgname=('python-olm' 'python2-olm')
pkgver=3.1.3
pkgrel=2
pkgdesc='python bindings for the olm cryptographic ratchet library'
arch=('any')
url='https://gitlab.matrix.org/matrix-org/olm'
license=('Apache')
depends=('libolm')
makedepends=('python-setuptools' 'python2-setuptools' 'python-cffi' 'python2-cffi')
checkdepends=()

source=("https://pypi.python.org/packages/source/p/$pkgbase/$pkgbase-$pkgver.tar.gz")
sha256sums=('9a6c6133ce3777788c88e3f18b13c5b36a2f76ed1a0e774d1a48adf542fee871')

prepare() {
  cp -a "$srcdir"/$pkgbase-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/$pkgbase-$pkgver
  python setup.py build
  cd "$srcdir"/$pkgbase-$pkgver-py2
  python2 setup.py build
}

package_python-olm() {
  depends=('python-cffi')
  cd "$srcdir"/$pkgbase-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

package_python2-olm() {
  depends=('python2-cffi')

  cd "$srcdir"/$pkgbase-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
