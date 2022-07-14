# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-aodhclient
pkgver=2.4.1
pkgrel=1
pkgdesc='Client library for the Aodh API'
arch=('any')
url="https://docs.openstack.org/$pkgname/"
license=('Apache')
depends=('python-pbr' 'python-cliff' 'python-osc-lib' 'python-oslo-i18n'
         'python-oslo-serialization' 'python-oslo-utils' 'python-osprofiler'
         'python-keystoneauth1' 'python-six' 'python-pyparsing')
checkdepends=('python-oslotest' 'python-stestr' 'python-testtools')
source=("https://github.com/openstack/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('480c098519084732f630427f9618797cf9d227497b60c759b4b2299fcfedee5d0fec35a78b581c3c8d9b2a034c7192714db3c68b1937936d2d14f6ac74f17639')

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
