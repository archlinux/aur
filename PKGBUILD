# Maintainer: Andy Botting <andy@andybotting.com>

# Python package name now is with an underscore
_pname=osc_placement
_name=osc-placement
pkgname="python-$_name"
pkgver=4.7.0
pkgrel=1
pkgdesc='OpenStackClient plugin for the Placement service'
arch=(any)
url="http://docs.openstack.org/$_name"
license=(Apache)
makedepends=(python-setuptools)
depends=(python-pbr python-six python-keystoneauth1
         python-osc-lib)
checkdepends=(python-oslotest python-openstackclient python-stestr
              python-wsgi-intercept)
source=("https://tarballs.opendev.org/openstack/$_name/$_pname-$pkgver.tar.gz")
sha512sums=('1039fc5668e2f6ce7251199259fed891a192c6455e762aabe0286d8e1f2352b1539874d1ee298c66b87bc97b452b97e3efcb339f4c3534877e5c49f8799cc041')

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
