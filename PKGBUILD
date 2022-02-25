# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Florian Wittmann

pkgname=python-tabledata
pkgver=1.3.0
pkgrel=4
pkgdesc='Python library to represent tabular data'
arch=('any')
url='https://github.com/thombashi/tabledata'
license=('MIT')
depends=('python-dataproperty' 'python-typepy')
makedepends=(
  'git'
  'python-setuptools'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-sphinx'
  'python-sphinx_rtd_theme')
checkdepends=('python-pytablewriter' 'python-pytest' 'python-dateutil' 'python-pytz')
source=("$pkgname::git+$url#tag=v$pkgver?signed")
sha256sums=('SKIP')
validpgpkeys=('BCF9203E5E80B5607EAE6FDD98CDA9A5F0BFC367')

build() {
  cd "$pkgname"
  python -m build --wheel --no-isolation
  cd docs
  PYTHONPATH=../ make man
}

check() {
  cd "$pkgname"
  PYTHONPATH=./ pytest -x
}

package() {
  export PYTHONHASHSEED=0
  cd "$pkgname"
  python -m installer --destdir="$pkgdir/" dist/*.whl
  install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 docs/_build/man/tabledata.1 -t "$pkgdir/usr/share/man/man1/"
}

# vim: ts=2 sw=2 et:
