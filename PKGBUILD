# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=python-sqliteschema
pkgver=1.2.1
pkgrel=1
pkgdesc='Dump table schema of a SQLite database file'
arch=('any')
url='https://github.com/thombashi/sqliteschema'
license=('MIT')
depends=(
  'python>=3.6'
  ## ALL DEPS BELOW THIS COMMENT ARE AUR ONLY
  'python-mbstrdecoder'
  'python-tabledata'
  'python-typepy')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-simplesqlite' 'python-pytz')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/s/sqliteschema/sqliteschema-$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::https://files.pythonhosted.org/packages/source/s/sqliteschema/sqliteschema-$pkgver.tar.gz.asc")
sha256sums=('dde195bd7bc70d5841bc01dff20ec23bd43be87d760d2dfc7c7f2e5fd3808ef3'
            'SKIP')
validpgpkeys=('BCF9203E5E80B5607EAE6FDD98CDA9A5F0BFC367')

build() {
  cd "sqliteschema-$pkgver"
  python setup.py build
}

check() {
  cd "sqliteschema-$pkgver"
  pytest -x
}

package() {
  cd "sqliteschema-$pkgver"
  PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
