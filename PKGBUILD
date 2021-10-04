# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=cleanpy
pkgver=0.3.1
pkgrel=1
pkgdesc='CLI tool to remove caches and temporary files related to Python'
arch=('any')
url='https://github.com/thombashi/cleanpy'
license=('MIT')
depends=('python')
makedepends=('git' 'python-setuptools')
# checkdepends=('python-pytest-runner' 'python-subprocrunner')
source=("$pkgname::git+$url#tag=v$pkgver?signed")
sha256sums=('SKIP')
validpgpkeys=('BCF9203E5E80B5607EAE6FDD98CDA9A5F0BFC367')

build() {
  cd "$pkgname"
  python setup.py build
}

## WONTFIX: tests require an existing installation of cleanpy
# check() {
#   cd "$pkgname"
#   python setup.py pytest
# }

package() {
  cd "$pkgname"
  PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
