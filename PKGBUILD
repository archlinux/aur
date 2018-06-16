# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

_name=mergedict
pkgname=('python-mergedict' 'python2-mergedict')
pkgbase=python-$_name
pkgver=0.2.0
pkgrel=2
pkgdesc="A Python dict with a merge() method"
arch=(any)
url="https://pypi.org/pypi/$_name"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
md5sums=('0a52ba99f7e56f5c88670ecfe422c5f7')

prepare() {
  cp -a $_name-$pkgver{,-py2}
}

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build

  cd "$srcdir/$_name-$pkgver-py2"
  python2 setup.py build
}

package_python-mergedict() {
  depends=('python')
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

package_python2-mergedict() {
  depends=('python2')
  cd "$srcdir/$_name-$pkgver-py2"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
