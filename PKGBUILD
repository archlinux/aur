# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: xantares

pkgname=python-pytablewriter
pkgver=0.64.0
pkgrel=1
pkgdesc='Python library to write a table in various formats'
arch=('any')
url='https://github.com/thombashi/pytablewriter'
license=('MIT')
depends=(
  'python>=3.6'
  'python-dataproperty>=0.52.0'
  'python-dataproperty<2'
  'python-mbstrdecoder>=1.0.0'
  'python-mbstrdecoder<2'
  'python-pathvalidate>=2.3.0'
  'python-pathvalidate<3'
  'python-tabledata>=1.1.3'
  'python-tabledata<2'
  'python-tcolorpy>=0.0.5'
  'python-tcolorpy<1'
  'python-typepy>=1.2.0'
  'python-typepy<2')
makedepends=('git' 'python-setuptools' 'python-sphinx' 'python-sphinx_rtd_theme')
# checkdepends=(
#   'python-idna'
#   'python-pytablereader>=0.29'
#   'python-pytest>=6.0.1'
#   'python-pytest-runner'
#   'python-sqliteschema'
#   'python-tablib')
source=("$pkgname::git+$url#tag=v$pkgver?signed")
sha256sums=('SKIP')
validpgpkeys=('BCF9203E5E80B5607EAE6FDD98CDA9A5F0BFC367')

build() {
  cd "$pkgname"
  python setup.py build
  cd docs
  PYTHONPATH=../ make man
}

# check() {
#   cd "$pkgname"
#   python setup.py pytest
# }

package() {
  cd "$pkgname"
  PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 docs/_build/man/pytablewriter.1 -t "$pkgdir/usr/share/man/man1/"
}

# vim: ts=2 sw=2 et:
