# Maintainer: Andy Botting <andy@andybotting.com>

_name=osc-placement
pkgname="python-$_name"
pkgver=4.3.0
pkgrel=3
pkgdesc='OpenStackClient plugin for the Placement service'
arch=(any)
url="http://docs.openstack.org/$_name"
license=(Apache)
makedepends=(python-setuptools)
depends=(python-pbr python-six python-keystoneauth1
         python-osc-lib)
checkdepends=(python-oslotest python-openstackclient python-stestr
              python-wsgi-intercept)
source=("https://tarballs.opendev.org/openstack/$_name/$_name-$pkgver.tar.gz")
sha512sums=('43d156d212e92cc86d92f2c7939dc6e5eb0436ea23afd87ad443549c1ff68b9363e776938da4580ac2a08c8d8e45dd4799ef42c445858383a37c6f1fd78ebeec')

export PBR_VERSION=$pkgver

build() {
  cd $_name-$pkgver
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
