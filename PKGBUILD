# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-saharaclient
pkgver=4.2.0
pkgrel=2
pkgdesc='Python client library for Sahara'
arch=(any)
url="http://docs.openstack.org/$pkgname/"
license=(Apache)
depends=(python-pbr python-babel python-keystoneauth1 python-osc-lib
         python-oslo-log python-oslo-serialization python-oslo-i18n
         python-oslo-utils python-openstackclient python-requests
         python-six)
checkdepends=(python-hacking python-mock python-oslotest python-stestr
              python-requests-mock)
source=("https://tarballs.opendev.org/openstack/$pkgname/$pkgname-$pkgver.tar.gz")
sha512sums=('05aa84c630330c87404752eaaebb63d3b52f0d3b9d9c5f8b70a0396f0dc731695cc9015a9d8e3ace8fc1d374c952358525d93a0768e1c8670256f6cba53d085b')

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
