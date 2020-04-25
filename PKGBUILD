# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-osprofiler
pkgver='3.1.0'
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
sha512sums=('0ad2562cb67a654e4e2b1316557f66e0f2792ff63a8b5558dd8764e09c1b88f2faf16feb5c6423d0e7a63155ac978a2beba35ada0a6e07e87cf8c1dc2d6ef1c2')

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
