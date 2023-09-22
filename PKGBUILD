# Maintainer: piernov <piernov@piernov.org>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Aleksandar Trifunović <akstrfn at gmail dot com>
# Contributor: Sergey Mastykov <smastykov at gmail dot com>

pkgname=python-pyramid
pkgver=2.0.2
pkgrel=1
pkgdesc='Open source Python web framework'
arch=('any')
url='https://github.com/Pylons/pyramid'
license=('custom:RPL')
depends=(
  'python-hupper'
  'python-plaster'
  'python-plaster-pastedeploy'
  'python-translationstring'
  'python-venusian'
  'python-webob'
  'python-zope-deprecation'
  'python-zope-interface')
makedepends=(
  'python-webtest'
  'python-zope-component'
  'python-nose'
  'python-virtualenv'
  'python-repoze.lru'
  'python-setuptools'
  'python-build'
  'python-installer'
  'python-wheel')
optdepends=(
  'python-pyramid-debugtoolbar: development mode'
  'python-pastedeploy: pserve/pcreate'
  'python-chameleon: pserve/pcreate'
  'python-waitress: pserve/pcreate')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/pyramid/pyramid-$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::https://files.pythonhosted.org/packages/source/p/pyramid/pyramid-$pkgver.tar.gz.asc")
sha256sums=('45431b387587ed0fac6213b54d6e9f0936f0cc85238a8f5af7852fc9484c5c77'
            'SKIP')
validpgpkeys=('CC1A48C957AC6ABEF05B2C596BC977B056B829E5')

build() {
  cd "pyramid-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "pyramid-$pkgver"
  PYTHONPATH=./src pytest -x --disable-warnings
}

package() {
  export PYTHONHASHSEED=0
  cd "pyramid-$pkgver"
  python -m installer --destdir="$pkgdir/" dist/*.whl
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
