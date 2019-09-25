# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-osprofiler
pkgver='2.8.2'
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
sha512sums=('bcf64f30d1b7acc92bfd233a6d1ced6cabea61edab0bfc0c50ed33d28fd8a61cacda28797c33ed4a70b05ea7ddf431156b20aa28dd69ce60adee42f2600668ec')

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
