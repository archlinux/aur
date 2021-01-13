# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-saharaclient
pkgver=3.3.0
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
sha512sums=('d62d684bfadc96758c2e0a85c188adb646f5022dac53e7797ebe6cdf2f27665a13dbb87e26f528eaa1299abe1f11b73de5ad5118e5fa10f9fe20193f31042933')

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
