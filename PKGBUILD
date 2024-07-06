# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-muranoclient
pkgver=2.8.0
pkgrel=2
pkgdesc='Python client library for Murano'
arch=(any)
url="https://docs.openstack.org/$pkgname/"
license=(Apache)
makedepends=(python-setuptools)
depends=(python-pbr python-prettytable python-glanceclient
         python-keystoneclient python-iso8601 python-six python-babel
         python-pyopenssl python-requests python-yaml python-yaql
         python-osc-lib python-muranopkgcheck python-oslo-serialization
         python-oslo-utils python-oslo-log python-oslo-i18n)
checkdepends=(python-fixtures python-mock python-requests-mock
              python-tempest python-stestr python-testscenarios
              python-testtools python-oslotest python-os-testr)
source=("https://tarballs.opendev.org/openstack/$pkgname/$pkgname-$pkgver.tar.gz")
sha512sums=('56317f399983a1cd4d313dbdce5c197bab3ee1a962235331ebaa3f1252ab2799bf133a4a5110101f2116be4c8c22a678abe0300f059871372ba68e858fd9980d')

export PBR_VERSION=$pkgver

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

check() {
  cd $pkgname-$pkgver
  # Fix test function name for Python 3
  sed -i 's/assertItemsEqual/assertCountEqual/g' muranoclient/tests/unit/osc/v1/*.py
  stestr run
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
