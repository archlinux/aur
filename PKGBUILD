# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-osprofiler
pkgver='2.9.0'
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
sha512sums=('1896c2cf0bdf85bf564297168090e46ad04fac69b0751c70ffe2bae13d9dbd84ca1cce7b5e46aa5919ce6a2c1f4bd8d0d994a35a45c3dcdb92fc8dde381e86d6')

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
