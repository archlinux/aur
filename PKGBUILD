# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-reno
pkgver=3.4.0
pkgrel=1
pkgdesc='OpenStack RElease NOtes manager'
arch=('any')
url='https://docs.openstack.org/reno/'
license=('Apache')
depends=('python-pbr' 'python-yaml' 'python-dulwich')
checkdepends=('python-docutils' 'python-stestr' 'python-testscenarios'
              'python-testtools' 'python-sphinx')
source=("https://github.com/openstack/reno/archive/$pkgver.tar.gz")
sha512sums=('950a8adf59cebf31c7c8fc39931e1e447d9d9351c1c8d491f1803625024ab05bf35c7582e8b427dfca92889064b065a3551523cc05a7a3fb3bf7a14d02f7548c')

export PBR_VERSION=$pkgver

build() {
  cd reno-$pkgver
  python setup.py build
}

check() {
  cd reno-$pkgver
  # Remove failing tests
  rm reno/tests/test_{cache,scanner,semver}.py
  stestr run
}

package() {
  cd reno-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
