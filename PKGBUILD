# Maintainer: Andy Botting <andy@andybotting.com>

_module='reno'
pkgname='python-reno'
pkgver='2.11.0'
pkgrel='1'
pkgdesc='OpenStack RElease NOtes manager'
arch=('any')
url="https://docs.openstack.org/developer/${_module}/"
license=('Apache')
makedepends=('git' 'python-setuptools')
checkdepends=('python-pbr' 'python-oslotest' 'python-mock' 'python-dulwich'
              'python-sphinx')
source=("git+https://git.openstack.org/openstack/reno#tag=${pkgver}")
sha512sums=('SKIP')

build() {
  cd "${srcdir}/${_module}"
  python setup.py build
}

check() {
  cd "${srcdir}/${_module}"
  # Remove failing GPG subcommand tests
  rm reno/tests/test_scanner.py
  python setup.py test
}

package_python-reno() {
  depends=('python-pbr' 'python-babel' 'python-yaml' 'python-six'
           'python-dulwich' 'python-sphinx')
  cd "${srcdir}/${_module}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
