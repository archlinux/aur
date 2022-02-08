# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: xantares

pkgname=python-pytablewriter
pkgver=0.64.1
pkgrel=2
pkgdesc='Python library to write a table in various formats'
arch=('any')
url='https://github.com/thombashi/pytablewriter'
license=('MIT')
depends=(
  'python-dataproperty'
  'python-mbstrdecoder'
  'python-pathvalidate'
  'python-tabledata'
  'python-tcolorpy'
  'python-typepy')
makedepends=(
  'git'
  'python-setuptools'
  'python-build'
  'python-install'
  'python-wheel'
  'python-sphinx'
  'python-sphinx_rtd_theme')
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
  python -m build --wheel --skip-dependency-check --no-isolation
  cd docs
  PYTHONPATH=../ make man
}

# check() {
#   cd "$pkgname"
#   python setup.py pytest
# }

package() {
  export PYTHONHASHSEED=0
  cd "$pkgname"
  python -m install --optimize=1 --destdir="$pkgdir/" dist/*.whl
  install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 docs/_build/man/pytablewriter.1 -t "$pkgdir/usr/share/man/man1/"
}

# vim: ts=2 sw=2 et:
