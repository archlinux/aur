# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python38-keystoneauth1
pkgver=5.0.0
pkgrel=2
pkgdesc="Authentication Library for OpenStack Identity"
arch=('any')
url="https://docs.openstack.org/developer/keystoneauth"
license=('Apache')
depends=('python38-pbr' 'python38-iso8601' 'python38-stevedore' 'python38-os-service-types' 'python38-requests')
optdepends=('python38-requests-kerberos: for kerberos support'
            'python38-lxml: for saml2 support'
            'python38-oauthlib: for oauth1 support'
            'python38-betamax: for betamax support'
            'python38-fixtures: for betamax support')
checkdepends=('python38-requests-mock' 'python38-testscenarios' 'python38-lxml'
              'python38-oslo-config' 'python38-betamax' 'python38-oslotest' 'python38-oslo-utils'
              'python38-requests-kerberos' 'python38-oauthlib' 'python38-pycodestyle' 'python38-hacking')
source=("$pkgname-$pkgver.tar.gz::https://github.com/openstack/keystoneauth/archive/$pkgver.tar.gz")
sha512sums=('51d69be2d55c2371f4666d2cdfb779c8f34ddfa1075d2591321732ab9cf902e01266980c1f172b690a291b4ebddce4859fd7adc1ff118fb0f87c255031fc378b')

export PBR_VERSION=$pkgver

prepare() {
  sed -i 's/pep8/pycodestyle/g' keystoneauth-$pkgver/keystoneauth1/tests/unit/test_hacking_checks.py
  sed -i 's/assertItemsEqual/assertCountEqual/' keystoneauth-$pkgver/keystoneauth1/tests/unit/extras/kerberos/*.py
}

build() {
  cd keystoneauth-$pkgver
  python3.8 setup.py build
}

check() {
  cd keystoneauth-$pkgver
  stestr run
}

package() {
  cd keystoneauth-$pkgver
  python3.8 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
