# Maintainer: Andy Botting <andy@andybotting.com>

_name=murano-pkg-check
pkgname=python-muranopkgcheck
pkgver=0.4.0
pkgrel=0
pkgdesc='Murano package validator tool'
arch=(any)
url='https://docs.openstack.org/$_name/'
license=(Apache)
makedepends=(python-setuptools)
depends=(python-pbr python-yaml python-yaql python-six
         python-stevedore python-semantic-version python-oslo-i18n)
checkdepends=(python-subunit python-oslotest python-oslotest
              python-testrepository python-testscenarios python-testtools
              python-stestr python-mock)
source=("$_name-$pkgver.tar.gz::https://github.com/NeCTAR-RC/$_name/archive/$pkgver.tar.gz")
sha512sums=('6d71532ea1fdc29e3231ed61033b6fbfef69e02d9e9fdf40a562689ca247acf3ae38cefd34a4ef1b063e81abd0efe43e9a800947c91f2ed1dadccede8da2572c')

export PBR_VERSION=$pkgver

build() {
  cd $_name-$pkgver
  python setup.py build
}

check() {
  cd $_name-$pkgver
  python -m unittest discover
}

package() {
  cd $_name-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
