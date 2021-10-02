# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Florian Wittmann

pkgname=python-dataproperty
pkgver=0.54.0
pkgrel=1
pkgdesc='Extract properties from data'
arch=('any')
url='https://github.com/thombashi/DataProperty'
license=('MIT')
depends=(
  'python-mbstrdecoder>=1.0.0'
  'python-mbstrdecoder<2'
  'python-typepy>=1.2.0'
  'python-typepy<2')
makedepends=('python-setuptools')
checkdepends=(
  'python-pytest>=6.0.1'
  'python-pytest-runner'
  'python-termcolor'
  'python-dateutil'
  'python-pytz')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/D/DataProperty/DataProperty-$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::https://files.pythonhosted.org/packages/source/D/DataProperty/DataProperty-$pkgver.tar.gz.asc")
sha256sums=('42b6efd1d121224938c632941d1bb862280eeb8c0c0a2ef93137e4a2bbc1cb36'
            'SKIP')
validpgpkeys=('BCF9203E5E80B5607EAE6FDD98CDA9A5F0BFC367')

build() {
  cd "DataProperty-$pkgver"
  python setup.py build
}

check() {
  cd "DataProperty-$pkgver"
  python setup.py pytest
}

package() {
  cd "DataProperty-$pkgver"
  PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
