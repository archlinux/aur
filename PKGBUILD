# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
pkgname=python2-linecache2
_name="${pkgname#python2-}"
pkgver=1.0.0
pkgrel=4
pkgdesc='Backports of the linecache module'
arch=('any')
_pypi='https://pypi.python.org'
url="$_pypi/$_name"
license=('PSF')
depends=('python2')
makedepends=('python2-setuptools' 'python2-pbr')
source=("$_pypi/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('4b26ff4e7110db76eeb6f5a7b64a82623839d595c2038eeda662f2a2db78e97c')

prepare() {
  cd "$srcdir/$_name-$pkgver"

  # Erase the tests that are actually syntax errors in Python 2.x
  sed -ri '101,111s-.*--' linecache2/tests/inspect_fodder2.py
}

build() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
