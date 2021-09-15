# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=python-sqliteschema
pkgver=1.2.0
pkgrel=1
pkgdesc='Dump table schema of a SQLite database file'
arch=('any')
url='https://github.com/thombashi/sqliteschema'
license=('MIT')
depends=(
  'python>=3.6'
  ## ALL DEPS BELOW THIS COMMENT ARE AUR ONLY
  'python-mbstrdecoder>=0.8.3'
  'python-mbstrdecoder<2'
  'python-tabledata>=1.0.0'
  'python-tabledata<2'
  'python-typepy>=1.1.4'
  'python-typepy<2')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner' 'python-simplesqlite>=1')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/s/sqliteschema/sqliteschema-$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::https://files.pythonhosted.org/packages/source/s/sqliteschema/sqliteschema-$pkgver.tar.gz.asc")
sha256sums=('4c18f141239c58b6dbdc69130be41ed9740d8209a7ab6d529ba982a8b79c071a'
            'SKIP')
validpgpkeys=('BCF9203E5E80B5607EAE6FDD98CDA9A5F0BFC367')

build() {
  cd "sqliteschema-$pkgver"
  python setup.py build
}

check() {
  cd "sqliteschema-$pkgver"
  python setup.py pytest
}

package() {
  cd "sqliteschema-$pkgver"
  PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
