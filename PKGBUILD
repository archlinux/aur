# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-osprofiler
pkgver='2.8.0'
pkgrel='1'
pkgdesc='Library for cross-project profiling library'
arch=('any')
url="https://docs.openstack.org/osprofiler/"
license=('Apache')
depends=('python-six' 'python-oslo-utils' 'python-webob' 'python-requests'
         'python-netaddr' 'python-oslo-concurrency' 'python-oslo-serialization'
         'python-prettytable')
checkdepends=('python-mock' 'python-stestr' 'python-ddt'
              'python-testrepository' 'python-testtools' 'python-elasticsearch'
              'python-pymongo' 'python-redis' 'python-docutils' 'bandit')
source=("https://github.com/openstack/osprofiler/archive/$pkgver.tar.gz")
sha512sums=('60ba181613b022bcb704e7f9a4b631c33e1fd924902d4a1a6ae7d9d221d554fa8936bd71f590be10bdaa42d9c2110e6de6d4993f7bf6d6fd1ab98d62ad7b0695')

export PBR_VERSION=$pkgver

build() {
  cd osprofiler-$pkgver
  python setup.py build
}

check() {
  cd osprofiler-$pkgver
  # Remove tests for Jaeger client - no package for it available
  rm osprofiler/tests/unit/drivers/test_jaeger.py
  stestr run
}

package() {
  cd osprofiler-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
