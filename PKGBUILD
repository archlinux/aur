# Maintainer: Damir Jelić <poljar@termina.org.uk>

pkgbase=python-olm
pkgname=('python-olm' 'python2-olm')
pkgver=3.1.0
pkgrel=2
pkgdesc='python bindings for the olm cryptographic ratchet library'
arch=('any')
url='https://gitlab.matrix.org/matrix-org/olm'
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools' 'python-cffi' 'python2-cffi')
checkdepends=()

source=("https://pypi.python.org/packages/source/p/$pkgbase/$pkgbase-$pkgver.tar.gz")
sha256sums=('eb7e022b805b4e7a0fb5af0aad6babce71c0cf2651282eaa2b32fc3781841c52')

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
  depends=('libolm' 'python-cffi')
  cd "$srcdir"/$pkgbase-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

package_python2-olm() {
  depends=('libolm' 'python2-cffi')

  cd "$srcdir"/$pkgbase-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
