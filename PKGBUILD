# Maintainer: Andy Botting <andy@andybotting.com>

# Python package name now is with an underscore
_pname=python_barbicanclient
pkgname=python-barbicanclient
pkgver=7.2.0
pkgrel=1
pkgdesc='Client library for the Barbican Key Management API'
arch=(any)
url="https://docs.openstack.org/$pkgname/"
license=(Apache)
makedepends=(python-setuptools)
depends=(python-pbr python-requests python-cliff
         python-keystoneauth1 python-oslo-i18n
         python-oslo-serialization python-oslo-utils)
checkdepends=(python-fixtures python-requests-mock python-stestr
              python-testtools python-oslotest python-oslo-config
              python-openstackclient)
source=("https://tarballs.opendev.org/openstack/$pkgname/$_pname-$pkgver.tar.gz")
sha512sums=('2a40de2369f46752b1f02ffa8bdcd371adc3aeb6c03bd691319f0b74519e212953de034237b96ef233330f0b16bff4182907f89369d3e0ceab5dd2f6328cc2d9')

export PBR_VERSION=$pkgver

build() {
  cd $_pname-$pkgver
  python setup.py build
}

check() {
  cd $_pname-$pkgver
  stestr run
}

package() {
  cd $_pname-$pkgver
  python setup.py install --root=$pkgdir --optimize=1
}
