# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=python-tblfaker
pkgver=0.2.4
pkgrel=1
pkgdesc='Python library to generate fake tabular data'
arch=('any')
url='https://github.com/thombashi/tblfaker'
license=('MIT')
depends=(
  'python-faker'
  'python-tabledata>=1.1.1'
  'python-tabledata<2')
makedepends=('python-setuptools')
# checkdepends=(
#   'python-pytablewriter>=0.46'
#   'python-pytest>=6.0.1'
#   'python-pytest-runner'
#   'python-pytest-discord>=0.0.5'
#   'python-pytest-md-report>=0.1'
#   'python-dateutil'
#   'python-pytz')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/t/tblfaker/tblfaker-$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::https://files.pythonhosted.org/packages/source/t/tblfaker/tblfaker-$pkgver.tar.gz.asc")
sha256sums=('3da3b13cfee632a20608b5854c9a40665c0e23d47db59b1f88ea0c3a0beb6fe2'
            'SKIP')
validpgpkeys=('BCF9203E5E80B5607EAE6FDD98CDA9A5F0BFC367')

build() {
  cd "tblfaker-$pkgver"
  python setup.py build
}

# check() {
#   cd "tblfaker-$pkgver"
#   python setup.py pytest
# }

package() {
  cd "tblfaker-$pkgver"
  PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm 644 'README.rst' -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 'LICENSE' -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
