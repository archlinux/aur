# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-osc-placement
pkgver=4.3.0
pkgrel=1
pkgdesc='OpenStackClient plugin for the Placement service'
arch=(any)
url="http://docs.openstack.org/osc-placement"
license=(Apache)
depends=(python-pbr python-six python-keystoneauth1
         python-osc-lib)
checkdepends=(python-oslotest python-openstackclient python-stestr
              python-wsgi-intercept)
source=("$pkgname-$pkgver.tar.gz::https://opendev.org/openstack/osc-placement/archive/$pkgver.tar.gz")
sha512sums=('d931b2a2381a73cfeca2c6a683e59f5640a5de28e8bb0e6b1c7c255136a342cff96d6d76d22f0010e8fbfe9326861d79427976fcb122433c0da9a9b198f223da')

export PBR_VERSION=$pkgver

build() {
  cd osc-placement
  python setup.py build
}

check() {
  cd osc-placement
  stestr run
}

package() {
  cd osc-placement
  python setup.py install --root="$pkgdir" --optimize=1
}
