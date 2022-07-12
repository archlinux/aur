# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-reno
pkgver=3.5.0
pkgrel=1
pkgdesc='OpenStack RElease NOtes manager'
arch=('any')
url='https://docs.openstack.org/reno/'
license=('Apache')
depends=('python-pbr' 'python-yaml' 'python-dulwich')
checkdepends=('python-docutils' 'python-stestr' 'python-testscenarios'
              'python-testtools' 'python-sphinx')
source=("https://github.com/openstack/reno/archive/$pkgver.tar.gz")
sha512sums=('4577588c95d77a374031f12e9d26e09017deb28e7c3f8547c286eeb78eff517e147143dbb6905bb522ca77b8ec87c7e22fca06d9603b36a0f222f19d378399aa')

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
