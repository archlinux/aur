# Maintainer: Andy Botting <andy@andybotting.com>

_name=osc-placement
pkgname="python-$_name"
pkgver=4.5.0
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
source=("https://tarballs.opendev.org/openstack/$_name/$_name-$pkgver.tar.gz")
sha512sums=('07008400d0d5880f533ae17d9951fe927b63340768c2b427b6e2d0d478fa98f11763440d4df5831be121a860bad44ffe79fb0377e062ff7e32fae56dd8321c34')

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
