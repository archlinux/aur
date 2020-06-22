# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-saharaclient
pkgver=3.2.0
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
source=("https://github.com/openstack/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('71f6f7396103ef4408f08bc19a5282c29f011e7fc741da5449cc1a18d35f68474627c540b5c90c626aaf98707a474d6bed6f9e0a8916ef2ea936b9066fb42b50')

export PBR_VERSION=$pkgver

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

check() {
  cd $pkgname-$pkgver
  sed -i 's/pep8/pycodestyle/g' saharaclient/tests/hacking/checks.py
  stestr run
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
