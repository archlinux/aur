# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-aodhclient
pkgver=3.3.0
pkgrel=1
pkgdesc='Client library for the Aodh API'
arch=('any')
url="https://docs.openstack.org/$pkgname/"
license=('Apache')
depends=('python-pbr' 'python-cliff' 'python-osc-lib' 'python-oslo-i18n'
         'python-oslo-serialization' 'python-oslo-utils' 'python-osprofiler'
         'python-keystoneauth1' 'python-six' 'python-pyparsing')
checkdepends=('python-oslotest' 'python-stestr' 'python-testtools')
source=("https://opendev.org/openstack/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('c46462166fde0a98e14b60532e8d0f264b9866568eb3650dd04c1af5e8867780d0b3b7eb578adbba29fc44b88c3c04fb2d5c4bf8ebcfed8abffb5ffca813bee9')

export PBR_VERSION=$pkgver

build() {
  cd $pkgname-$pkgver
  # Remove functional tests as they're complicated to run
  rm -fr aodhclient/tests/functional
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

# vim:set ts=2 sw=2 et:
