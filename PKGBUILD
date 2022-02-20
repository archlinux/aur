# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=python-sqliteschema
pkgver=1.3.0
pkgrel=1
pkgdesc='Dump table schema of a SQLite database file'
arch=('any')
url='https://github.com/thombashi/sqliteschema'
license=('MIT')
depends=(
  ## ALL DEPS BELOW THIS COMMENT ARE AUR ONLY
  'python-mbstrdecoder'
  'python-tabledata'
  'python-typepy')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-simplesqlite' 'python-pytz')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/s/sqliteschema/sqliteschema-$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::https://files.pythonhosted.org/packages/source/s/sqliteschema/sqliteschema-$pkgver.tar.gz.asc"
        'remove-whitespace-from-description.patch')
sha256sums=('1acdd5087cab54a099135a5623bb1960019816e2e3042b889c637901a832d3c3'
            'SKIP'
            'fc29d212e474ac34d25e7fadbe349298f14802325b9c293c2eb21cf53993ea1e')
validpgpkeys=('BCF9203E5E80B5607EAE6FDD98CDA9A5F0BFC367')

prepare() {
  patch -p1 -d "sqliteschema-$pkgver" < remove-whitespace-from-description.patch
}

build() {
  cd "sqliteschema-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "sqliteschema-$pkgver"
  pytest -x
}

package() {
  export PYTHONHASHSEED=0
  cd "sqliteschema-$pkgver"
  python -m installer --destdir="$pkgdir/" dist/*.whl
  install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
