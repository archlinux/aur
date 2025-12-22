# Maintainer: Andy Botting <andy@andybotting.com>

_pname=python_mistralclient
pkgname=python-mistralclient
pkgver=6.1.0
pkgrel=1
pkgdesc='Mistral Client Library'
arch=(any)
url="https://docs.openstack.org/$pkgname/"
license=(Apache)
makedepends=(python-setuptools)
depends=(python-cliff python-osc-lib python-oslo-utils
         python-oslo-i18n python-pbr python-keystoneclient
         python-yaml python-requests python-six python-stevedore)
checkdepends=(python-openstackclient python-oslotest python-requests-mock
              python-tempest python-osprofiler python-stestr
              python-openstacksdk)
source=("https://tarballs.opendev.org/openstack/$pkgname/$_pname-$pkgver.tar.gz")
sha512sums=('6570f356a70ad4d772abb15a4ffef4d33fc3499cc4ff98a9cf6700551c0a46d7004f4f82903072ae11ea418dd2eac76b5099a0d9da1321d473e8588cbc924b69')

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
  python setup.py install --root="$pkgdir" --optimize=1
}
