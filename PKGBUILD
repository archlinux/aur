# Maintainer: Balló György <ballogyor+arch at gmail dot com>

_pkgbase=mohawk
pkgbase=python-mohawk
pkgname=('python2-mohawk' 'python-mohawk')
pkgver=0.3.4
pkgrel=2
pkgdesc=" Python library for Hawk HTTP authorization"
arch=('any')
url="https://github.com/kumar303/mohawk"
license=('BSD')
depends=('python-six' 'python2-six')
makedepends=('python-setuptools' 'python2-setuptools')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/kumar303/$_pkgbase/archive/$pkgver.tar.gz")
sha256sums=('26fd94a894cdaec1349fa05eae4e7766c63da7cad04a8a4b3eff3a3a0736f203')

prepare() {
  cp -a $_pkgbase-$pkgver{,-py2}
}

build() {
  # Building Python2
  cd $_pkgbase-$pkgver-py2
  python2 setup.py build

  # Building Python3
  cd ../$_pkgbase-$pkgver
  python3 setup.py build
}

package_python2-mohawk() {
  depends=('python2-six')

  cd $_pkgbase-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

package_python-mohawk() {
  depends=('python-six')

  cd $_pkgbase-$pkgver 
  python3 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
