# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=python-pytest-md-report
_name="${pkgname#python-}"
pkgver=0.1.2
pkgrel=1
pkgdesc='Pytest plugin to create a report in Markdown table format'
arch=('any')
url='https://github.com/thombashi/pytest-md-report'
license=('MIT')
depends=(
  'python>=3.6'
  'python-pytablewriter>=0.59.0'
  'python-pytablewriter<1'
  'python-pytest>=3.3.2'
  'python-pytest<7'
  'python-tcolorpy>=0.0.5'
  'python-tcolorpy<1'
  'python-typepy>=1.1.1'
  'python-typepy<2')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner' 'python-dateutil' 'python-pytz')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz.asc")
sha256sums=('2b8e85fce3b5f4c17128bbd9a25bbf3ada4be4281518e301a7ef0ecfdc71e965'
            'SKIP')
validpgpkeys=('BCF9203E5E80B5607EAE6FDD98CDA9A5F0BFC367')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

check() {
  cd "$_name-$pkgver"
  python setup.py pytest
}

package() {
  cd "$_name-$pkgver"
  PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm 644 'README.rst' -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 'LICENSE' -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
