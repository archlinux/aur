# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-saharaclient
pkgver=4.1.0
pkgrel=2
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
sha512sums=('0bd3b2a7f12e6540bb2351f6d32dd2d7d757cddcb86d73d8f09afc5cf2110cb5ed9b46356b3e8ec9f6f9532ec039e7a824f827f561ec20c825ff03ec2f69a0a0')

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
