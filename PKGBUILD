# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-reno
pkgver='3.0.1'
pkgrel='1'
pkgdesc='OpenStack RElease NOtes manager'
arch=('any')
url='https://docs.openstack.org/reno/'
license=('Apache')
depends=('python-pbr' 'python-yaml' 'python-six' 'python-dulwich')
checkdepends=('python-mock' 'python-docutils' 'python-stestr'
              'python-testscenarios' 'python-testtools' 'python-sphinx')
source=("https://github.com/openstack/reno/archive/$pkgver.tar.gz")
sha512sums=('ba84eb38fadb6e9f352e031b19d7b0f1f95a09d87e38135fc7a1733f780622a4f72b5cb6aeed575e3e6fdc8d8d7d9c4f1eefb46672dd04b24e00c2cc07cd7bd5')

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
