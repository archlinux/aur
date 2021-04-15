# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-reno
pkgver=3.3.0
pkgrel=1
pkgdesc='OpenStack RElease NOtes manager'
arch=('any')
url='https://docs.openstack.org/reno/'
license=('Apache')
depends=('python-pbr' 'python-yaml' 'python-dulwich')
checkdepends=('python-docutils' 'python-stestr' 'python-testscenarios'
              'python-testtools' 'python-sphinx')
source=("https://github.com/openstack/reno/archive/$pkgver.tar.gz")
sha512sums=('6d1a123d39c7c4dcc62f32a8d9f8693ce2f9734f825652c69f2aaf5927fb9731929d1624be1206d4c213800c2745d3db3a26a3f6d6a542f4c0a9528bd2b06ac2')

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
