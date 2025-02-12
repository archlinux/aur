# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Original Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-opentracing
pkgver=2.4.0
pkgrel=6
pkgdesc="OpenTracing API for Python"
url="https://github.com/opentracing/opentracing-python"
license=('Apache-2.0')
arch=('any')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-gevent' 'python-mock' 'python-pytest' 'python-tornado' 'python-six')
source=("https://github.com/opentracing/opentracing-python/archive/$pkgver/$pkgname-$pkgver.tar.gz"
    "python-3.11-compat.patch"
    "python-3.12-compat.patch")
sha512sums=('de5e5a211fd487039e5658fc6303f3521ee038e205d9d1560cb33f3a66fd0de8d666b2adc785fe2683b4993879e5124ba25467feb17fe68b1cbddc0581ca16b3'
            '920ae7fd81d33957dbc46105a62371022391645a40a23debe52764771f9562e287cae7f3485894bb562ce5bf6f91b6b9ae37a16ff8c1dec6099e235e4fba3dad'
            '508147e7de80f3985294f1bf316a481c27a0bf52b2d013498b342785afc16d74b6d89ae925a80683c138074a89caf1b0bbac08539b233ea4ab5d49d376d0fcd3')

prepare() {
  cd opentracing-python-$pkgver
  patch -Np1 -i ${srcdir}/python-3.11-compat.patch
  patch -Np1 -i ${srcdir}/python-3.12-compat.patch
}

build() {
  cd opentracing-python-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd opentracing-python-$pkgver
  pytest tests
  python -m testbed
}

package() {
  cd opentracing-python-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
