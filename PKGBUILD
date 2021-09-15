# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Florian Wittmann

_name=SimpleSQLite

pkgname=python-simplesqlite
pkgver=1.3.0
pkgrel=1
pkgdesc='Simplify SQLite database operations'
arch=('any')
url='https://github.com/thombashi/SimpleSQLite'
license=('MIT')
depends=(
  'python>=3.6'
  'python-dataproperty>=0.50.1'
  'python-dataproperty<2'
  'python-mbstrdecoder>=1.0.0'
  'python-mbstrdecoder<2'
  'python-pathvalidate>=2.2.2'
  'python-pathvalidate<3'
  'python-sqliteschema>=1.2.0'
  'python-sqliteschema<2'
  'python-tabledata>=1.1.3'
  'python-tabledata<2'
  'python-typepy>=1.1.4'
  'python-typepy<2')
makedepends=('python-setuptools')
checkdepends=(
  'python-pytablereader>=0.28'
  'python-pytablewriter>=0.50'
  'python-pytest>=6.0.1'
  'python-pytest-runner'
  'python-dateutil'
  'python-pytz'
  # 'python-path<13'
  ## yes these are required...
  'python-pytest-md-report>=0.1'
  'python-pytest-discord>=0.0.7')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz.asc")
sha256sums=('f7e862bec5982059e665cc73b6fdb4c8340a1f565ba3497387c3c48f10d43bf8'
            'SKIP')
validpgpkeys=('BCF9203E5E80B5607EAE6FDD98CDA9A5F0BFC367')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

## FIXME: pytest pulls path.py<13 because Arch no longer packages this version
check() {
  cd "$_name-$pkgver"
  python setup.py pytest
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
