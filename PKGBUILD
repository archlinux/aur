# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Florian Wittmann

pkgname=python-dataproperty
pkgver=0.54.2
pkgrel=2
pkgdesc='Extract properties from data'
arch=('any')
url='https://github.com/thombashi/DataProperty'
license=('MIT')
depends=('python-mbstrdecoder' 'python-typepy')
makedepends=('python-setuptools' 'python-docutils' 'python-pygments')
checkdepends=(
  'python-pytest'
  'python-pytest-runner'
  'python-termcolor'
  'python-dateutil'
  'python-pytz')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/D/DataProperty/DataProperty-$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::https://files.pythonhosted.org/packages/source/D/DataProperty/DataProperty-$pkgver.tar.gz.asc")
sha256sums=('df2fcf00e7a57f0a6089f686f847527eb3c91ded5c419daef6d06ee4bb1187b4'
            'SKIP')
validpgpkeys=('BCF9203E5E80B5607EAE6FDD98CDA9A5F0BFC367')

build() {
  cd "DataProperty-$pkgver"
  python setup.py build
  rst2man README.rst "$pkgname.7"
}

check() {
  cd "DataProperty-$pkgver"
  python setup.py pytest
}

package() {
  cd "DataProperty-$pkgver"
  PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 "$pkgname.7" -t "$pkgdir/usr/share/man/man7/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
