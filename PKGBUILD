# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Florian Wittmann

pkgname=python-dataproperty
pkgver=0.54.2
pkgrel=3
pkgdesc='Extract properties from data'
arch=('any')
url='https://github.com/thombashi/DataProperty'
license=('MIT')
depends=('python-mbstrdecoder' 'python-typepy')
makedepends=(
  'python-setuptools'
  'python-build'
  'python-install'
  'python-wheel'
  'python-docutils'
  'python-pygments')
checkdepends=(
  'python-pytest'
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
  python -m build --wheel --skip-dependency-check --no-isolation
  rst2man README.rst "$pkgname.7"
}

check() {
  cd "DataProperty-$pkgver"
  PYTHONPATH=./ pytest -x --disable-warnings
}

package() {
  export PYTHONHASHSEED=0
  cd "DataProperty-$pkgver"
  python -m install --optimize=1 --destdir="$pkgdir/" dist/*.whl
  install -Dm644 "$pkgname.7" -t "$pkgdir/usr/share/man/man7/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
