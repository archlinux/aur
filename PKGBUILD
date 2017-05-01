# Maintainer: Rafael Fontenelle <rafaeff@gnome.org>

_pypiname=jsmin
pkgname=('python-jsmin' 'python2-jsmin')
pkgbase=python-$_pypiname
pkgver=2.2.2
pkgrel=1
pkgdesc="JavaScript minifier"
arch=(any)
url="https://pypi.python.org/pypi/jsmin"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
options=(!emptydirs)
source=($_pypiname-release-$pkgver::https://github.com/tikitu/jsmin/archive/release-$pkgver.tar.gz)
md5sums=('4813c3e28a01d31545bb8db09de86cac')

prepare() {
  cp -a $_pypiname-release-$pkgver{,-py2}
}

build() {
  cd "$srcdir/$_pypiname-release-$pkgver"
  python setup.py build

  cd "$srcdir/$_pypiname-release-$pkgver-py2"
  python2 setup.py build
}

package_python-jsmin() {
  depends=('python')
  cd "$srcdir/$_pypiname-release-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

package_python2-jsmin() {
  depends=('python2')
  cd "$srcdir/$_pypiname-release-$pkgver-py2"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

# vim:set ts=2 sw=2 et:
