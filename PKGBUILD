# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Original Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-opentracing
pkgver=2.4.0
pkgrel=5
pkgdesc="OpenTracing API for Python"
url="https://github.com/opentracing/opentracing-python"
license=('Apache')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-gevent' 'python-mock' 'python-pytest' 'python-tornado')
source=("https://github.com/opentracing/opentracing-python/archive/$pkgver/$pkgname-$pkgver.tar.gz" "python-3.11-compat.patch")
sha512sums=('de5e5a211fd487039e5658fc6303f3521ee038e205d9d1560cb33f3a66fd0de8d666b2adc785fe2683b4993879e5124ba25467feb17fe68b1cbddc0581ca16b3'
            '920ae7fd81d33957dbc46105a62371022391645a40a23debe52764771f9562e287cae7f3485894bb562ce5bf6f91b6b9ae37a16ff8c1dec6099e235e4fba3dad')

prepare() {
  cd opentracing-python-$pkgver
  patch -Np1 -i ${srcdir}/python-3.11-compat.patch
}

build() {
  cd opentracing-python-$pkgver
  python setup.py build
}

check() {
  cd opentracing-python-$pkgver
  pytest tests
  python -m testbed
}

package() {
  cd opentracing-python-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
