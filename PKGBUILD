# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-cloudkittyclient
pkgver=5.3.0
pkgrel=1
pkgdesc='Client library for the CloudKitty API'
arch=(any)
url="https://docs.openstack.org/$pkgname/"
license=(Apache)
makedepends=(python-setuptools)
depends=(python-pbr python-cliff python-keystoneauth1
         python-oslo-utils python-oslo-log python-yaml
         python-jsonpath-rw-ext python-os-client-config
         python-osc-lib)
checkdepends=(python-oslotest python-stestr python-openstackclient)
source=("https://tarballs.opendev.org/openstack/$pkgname/$pkgname-$pkgver.tar.gz")
sha512sums=('76f04741e99328e4480a98c26f56b371aed4a2b412a4e4fa947817ad818b37f5367e155d9e2f93e89ddfea5ebadfaad76bed092aa246acd14ce175c253fee8ea')

export PBR_VERSION=$pkgver

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

check() {
  cd $pkgname-$pkgver
  stestr run
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
