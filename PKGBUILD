# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-saharaclient
pkgver='2.2.1'
pkgrel='1'
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
sha512sums=('632b5cb112ea0d50ee0fa13bc929adc7ed584ca06d6125a7f6e4f7da19686bd6b223b2b754a52c56472768904219b6dcf11f1e0e075a394d88b4c172fc24dba1')

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
