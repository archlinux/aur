# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Florian Wittmann

pkgname=python-tabledata
pkgver=1.3.0
pkgrel=2
pkgdesc='Python library to represent tabular data'
arch=('any')
url='https://github.com/thombashi/tabledata'
license=('MIT')
depends=(
  'python>=3.6'
  ## ALL AUR
  'python-dataproperty>=0.53.0'
  'python-dataproperty<1'
  'python-typepy>=1.2.0'
  'python-typepy<2')
makedepends=('git' 'python-setuptools' 'python-sphinx' 'python-sphinx_rtd_theme')
checkdepends=('python-pytablewriter>=0.46' 'python-pytest-runner' 'python-dateutil' 'python-pytz')
source=("$pkgname::git+$url")
sha256sums=('SKIP')
validpgpkeys=('BCF9203E5E80B5607EAE6FDD98CDA9A5F0BFC367')

build() {
  cd "$pkgname"
  python setup.py build
  cd docs
  PYTHONPATH=../ make man
}

check() {
  cd "$pkgname"
  python setup.py pytest
}

package() {
  cd "$pkgname"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 docs/_build/man/tabledata.1 -t "$pkgdir/usr/share/man/man1/"
}

# vim: ts=2 sw=2 et:
