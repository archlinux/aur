# Maintainer: Andy Botting <andy@andybotting.com>

_name=aodhclient
pkgname=python-aodhclient
pkgver=3.12.0
pkgrel=1
pkgdesc='Client library for the Aodh API'
arch=(any)
url="https://docs.openstack.org/$pkgname/"
license=(Apache)
makedepends=(python-setuptools)
depends=(python-pbr python-cliff python-osc-lib python-oslo-i18n
         python-oslo-serialization python-oslo-utils python-osprofiler
         python-keystoneauth1 python-six python-pyparsing)
checkdepends=(python-oslotest python-stestr python-testtools)
source=("https://tarballs.opendev.org/openstack/$pkgname/$_name-$pkgver.tar.gz")
sha512sums=('5e0ad905cf8ad20208619b1ff11f981ace35812dfdbcf3ef3cd50e6deb281222842684fc04aa464fac44e1889608a03dcc977c23eb9718a4cd9279351d85832d')

export PBR_VERSION=$pkgver

build() {
  cd $_name-$pkgver
  # Remove functional tests as they're complicated to run
  rm -fr aodhclient/tests/functional
  python setup.py build
}

check() {
  cd $_name-$pkgver
  stestr run
}

package() {
  cd $_name-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
