# Maintainer: Balló György <ballogyor+arch at gmail dot com>

_pkgbase=requests-hawk
pkgbase=python-requests-hawk
pkgname=('python2-requests-hawk' 'python-requests-hawk')
pkgver=1.0.0
pkgrel=2
pkgdesc="Hawk authentication strategy for the requests python library"
arch=('any')
url="https://github.com/mozilla-services/requests-hawk"
license=('Apache')
depends=('python-mohawk' 'python-requests' 'python2-mohawk' 'python2-requests')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/mozilla-services/$_pkgbase/archive/$pkgver.tar.gz")
sha256sums=('6d1be6fab72659952069048081b26e0d536f3d2960640452943cd347a1b2e117')

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

package_python2-requests-hawk() {
  depends=('python2-mohawk' 'python2-requests')

  cd $_pkgbase-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
}

package_python-requests-hawk() {
  depends=('python-mohawk' 'python-requests')

  cd $_pkgbase-$pkgver 
  python3 setup.py install --root="$pkgdir" --optimize=1
}
