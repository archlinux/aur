# Submitter: Rafael Fontenelle <rafaeff@gnome.org>
# Maintainer: Martin Minka <martin.minka@gmail.com>

_name=jsmin
pkgname=('python-jsmin' 'python2-jsmin')
pkgbase=python-$_name
pkgver=3.0.0
pkgrel=1
pkgdesc="JavaScript minifier"
arch=(any)
url="https://pypi.org/pypi/$_name"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('88fc1bd6033a47c5911dbcada7d279c7a8b7ad0841909590f6a742c20c4d2e08')

prepare() {
  cp -a $_name-$pkgver{,-py2}
}

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build

  cd "$srcdir/$_name-$pkgver-py2"
  python2 setup.py build
}

package_python-jsmin() {
  depends=('python')
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

package_python2-jsmin() {
  depends=('python2')
  cd "$srcdir/$_name-$pkgver-py2"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
