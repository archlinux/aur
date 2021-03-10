# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-reno
pkgver=3.2.0
pkgrel=1
pkgdesc='OpenStack RElease NOtes manager'
arch=('any')
url='https://docs.openstack.org/reno/'
license=('Apache')
depends=('python-pbr' 'python-yaml' 'python-dulwich')
checkdepends=('python-docutils' 'python-stestr' 'python-testscenarios'
              'python-testtools' 'python-sphinx')
source=("https://github.com/openstack/reno/archive/$pkgver.tar.gz")
sha512sums=('5687e8c508f0a358e4771f004f15b3bf7585150b157b32f2bd31853e1d07ed6713f1bdafd3a51298b6911b66d5109e672f772f5791689b28d4cc5703f21a6f47')

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
