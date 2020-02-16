# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-osprofiler
pkgver='3.0.0'
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
sha512sums=('6bb31536fd17f67b19fe251f779d008d3e9aed6faf4d382e77e2507b17f1aba2a60c8cb5275ba3f267d383398f3473943abfeae82bc24b12a0b5f8df6d546697')

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
