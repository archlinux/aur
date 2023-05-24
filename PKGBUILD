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
source=("https://github.com/openstack/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('e6b11178651bbac814050bace5bd4101562c7bb430b6acd1ccedac4c89c97fa50b661d9ae1f25b8099853c55af7246995b573d839c404e64afe2629024adcf93')

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
