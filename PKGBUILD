# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=python-pingparsing
pkgver=1.4.0
pkgrel=2
pkgdesc='CLI and library parser and transmitter for `ping`'
arch=('any')
url='https://github.com/thombashi/pingparsing'
license=('MIT')
depends=('python-humanreadable' 'python-pyparsing' 'python-subprocrunner' 'python-typepy')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pytest-runner' 'python-dateutil' 'python-pytz')
provides=('pingparsing')
replaces=('pingparsing')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/pingparsing/pingparsing-$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::https://files.pythonhosted.org/packages/source/p/pingparsing/pingparsing-$pkgver.tar.gz.asc")
sha256sums=('daeb6de8c3c7d51c3dd70f066602b9c4fdad9bb9d80da68fb20fe44e8e2ca972'
            'SKIP')
validpgpkeys=('BCF9203E5E80B5607EAE6FDD98CDA9A5F0BFC367')

prepare() {
  cd "pingparsing-$pkgver"
  sed -i \
    '/packages=/c\packages=setuptools.find_packages(exclude=['tests*', 'examples*']),' \
    setup.py
}

build() {
  cd "pingparsing-$pkgver"
  python setup.py build
}

check() {
  cd "pingparsing-$pkgver"
  python setup.py pytest
}

package() {
  cd "pingparsing-$pkgver"
  PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
