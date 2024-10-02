# Maintainer: Andy Botting <andy@andybotting.com>

_name=aodhclient
pkgname=python-aodhclient
pkgver=3.6.0
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
sha512sums=('4f168a1d54d376c397b233328f3949bdb7ad388d6caa4ed500600a6b95c330514bd017a1e4780e814b2977fce6a48534c1e7cc8722b889ceec054e4fd623bbbf')

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
