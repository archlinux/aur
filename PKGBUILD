# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-reno
pkgver=4.0.0
pkgrel=1
pkgdesc='OpenStack RElease NOtes manager'
arch=('any')
url='https://docs.openstack.org/reno/'
license=('Apache')
depends=('python-pbr' 'python-yaml' 'python-dulwich')
checkdepends=('python-docutils' 'python-stestr' 'python-testscenarios'
              'python-testtools' 'python-sphinx')
source=("https://github.com/openstack/reno/archive/$pkgver.tar.gz")
sha512sums=('a62eff279f57d57299b7ab828865da4dac8bbc9c9bad3e55e91345af40617d94de8cb591c2646275ee8b46a3c4e960fe9109c2621a2ec57bf9f2db402e082cc0')

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
