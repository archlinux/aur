# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=python-pingparsing
_name="${pkgname#python-}"
pkgver=1.3.2
pkgrel=1
pkgdesc='CLI and library parser and transmitter for `ping`'
arch=('any')
url='https://github.com/thombashi/pingparsing'
license=('MIT')
depends=(
  'python-humanreadable>=0.1.0'
  'python-humanreadable<1'
  'python-pyparsing>=2.0.3'
  'python-pyparsing<3'
  'python-subprocrunner>=1.2.2'
  'python-subprocrunner<2'
  'python-typepy>=1.1.0'
  'python-typepy<2')
makedepends=('python-setuptools')
checkdepends=('python-pytest>=6.0.1' 'python-pytest-runner' 'python-dateutil' 'python-pytz')
provides=('pingparsing')
replaces=('pingparsing')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz.asc")
sha256sums=('70dfb238c6b9b8fdae98e7aa336c60009388c5c19713b77a730c78104732a0c6'
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
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  rm -rf "$pkgdir/usr/lib/python"*'/site-packages/examples'
}

# vim: ts=2 sw=2 et:
