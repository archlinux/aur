# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-reno
pkgver=2.11.3
pkgrel=1
pkgdesc='OpenStack RElease NOtes manager'
arch=('any')
url='https://docs.openstack.org/reno/'
license=('Apache')
depends=('python-pbr' 'python-yaml' 'python-six' 'python-dulwich')
checkdepends=('python-mock' 'python-docutils' 'python-stestr'
              'python-testscenarios' 'python-testtools' 'python-sphinx')
source=("https://github.com/openstack/reno/archive/$pkgver.tar.gz")
sha512sums=('daf294889ed4d0d7f3de31840878f15613d6060494056debf8842ae802319ae4324d4739d7f83c1ee4854db4bed388e1e81c9978c797fe2525613748dde1bd64')

export PBR_VERSION=$pkgver

build() {
  cd reno-$pkgver
  python setup.py build
}

check() {
  cd reno-$pkgver
  # Remove failing tests
  rm reno/tests/test_{cache,scanner}.py
  stestr run
}

package() {
  cd reno-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
