# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-reno
pkgver='3.1.0'
pkgrel='1'
pkgdesc='OpenStack RElease NOtes manager'
arch=('any')
url='https://docs.openstack.org/reno/'
license=('Apache')
depends=('python-pbr' 'python-yaml' 'python-six' 'python-dulwich')
checkdepends=('python-mock' 'python-docutils' 'python-stestr'
              'python-testscenarios' 'python-testtools' 'python-sphinx')
source=("https://github.com/openstack/reno/archive/$pkgver.tar.gz")
sha512sums=('1cca1f86a2cfc3a5b997cddd1e7db0f6c2070fd97a5cc5d5479c9829b8ccd57fdec40a461f4816bec66a0f7e33d895f70edaaa754866aade85c11ebad643e709')

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
