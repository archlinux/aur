# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Florian Wittmann

pkgname=python-subprocrunner
pkgver=2.0.0
pkgrel=1
pkgdesc='Python wrapper library for subprocess module'
arch=('any')
url='https://github.com/thombashi/subprocrunner'
license=('MIT')
depends=('python-mbstrdecoder')
makedepends=('python-setuptools')
# checkdepends=('python-pytest-runner' 'python-pytest-mock' 'python-typepy')
source=(
  "$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/s/subprocrunner/subprocrunner-$pkgver.tar.gz"
  "$pkgname-$pkgver.tar.gz.asc::https://files.pythonhosted.org/packages/source/s/subprocrunner/subprocrunner-$pkgver.tar.gz.asc")
sha256sums=('fd22aad8befd610461536463955e205122fed80303b814cc926c3a4a8d9aaf3c'
            'SKIP')
validpgpkeys=('BCF9203E5E80B5607EAE6FDD98CDA9A5F0BFC367')

build() {
  cd "subprocrunner-$pkgver"
  python setup.py build
}

## tests fail due to nonexistent 'hostname' command
# check() {
#   cd "$_name-$pkgver"
#   python setup.py pytest
# }

package() {
  export PYTHONHASHSEED=0
  cd "subprocrunner-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
