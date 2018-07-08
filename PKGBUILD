# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: twa022 <twa022 at gmail dot com>

_pkgbase=hawkauthlib
pkgbase=python-hawkauthlib
pkgname=('python2-hawkauthlib' 'python-hawkauthlib')
pkgver=2.0.0
pkgrel=2
pkgdesc="Low-level library for implementing MAC Access Authentication"
arch=('any')
url="https://github.com/mozilla-services/hawkauthlib"
license=('MPL2')
depends=('python-requests' 'python2-requests' 'python-webob' 'python2-webob')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/mozilla-services/$_pkgbase/archive/v$pkgver.tar.gz")
sha256sums=('5ad32548bffdf328284c4fb56770ed7a1a39309aa8639be95759df05aec7e6d1')

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

package_python2-hawkauthlib() {
  depends=('python2-requests' 'python2-webob')

  cd $_pkgbase-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
}

package_python-hawkauthlib() {
  depends=('python-requests' 'python-webob')

  cd $_pkgbase-$pkgver 
  python3 setup.py install --root="$pkgdir" --optimize=1
}
