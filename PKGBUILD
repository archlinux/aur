# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
_name=pytest-datafiles
pkgname=('python-pytest-datafiles' 'python2-pytest-datafiles')
pkgbase=python-$_name
pkgver=2.0
pkgrel=2
pkgdesc="py.test plugin to create a 'tmpdir' containing predefined files/directories."
arch=(any)
url="https://github.com/omarkohl/pytest-datafiles"
license=('MIT')
makedepends=(python-pytest python2-pytest python-setuptools python2-setuptools)
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('143329cbb1dbbb07af24f88fa4668e2f59ce233696cf12c49fd1c98d1756dbf9')

prepare() {
  cp -a $_name-$pkgver{,-py2}
}

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build

  cd "$srcdir/$_name-$pkgver-py2"
  python2 setup.py build
}

package_python-pytest-datafiles() {
  depends=(python-pytest)
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-pytest-datafiles() {
  depends=(python2-pytest)
  cd "$srcdir/$_name-$pkgver-py2"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
