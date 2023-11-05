# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-saharaclient
pkgver=4.2.0
pkgrel=1
pkgdesc='Python client library for Sahara'
arch=('any')
url="http://docs.openstack.org/$pkgname/"
license=('Apache')
depends=('python-pbr' 'python-babel' 'python-keystoneauth1' 'python-osc-lib'
         'python-oslo-log' 'python-oslo-serialization' 'python-oslo-i18n'
         'python-oslo-utils' 'python-openstackclient' 'python-requests'
         'python-six')
checkdepends=('python-hacking' 'python-mock' 'python-oslotest' 'python-stestr'
              'python-requests-mock')
source=("https://opendev.org/openstack/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('ec24113bfe3be51a8c838e8ea9d9a730b74afc7492647c9de09306676850c8e3ec435ccb3258a6fac978cc41938e8ef735e217c5dc2b5d6fe69ee4c98fc598fd')

export PBR_VERSION=$pkgver

build() {
  cd $pkgname
  python setup.py build
}

check() {
  cd $pkgname
  sed -i 's/pep8/pycodestyle/g' saharaclient/tests/hacking/checks.py
  stestr run
}

package() {
  cd $pkgname
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
