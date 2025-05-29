# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: tsipizic

pkgname=python-yeelight
pkgver=0.7.16
pkgrel=1
_commit=c0ab648869ab7cde10d90a06b271ad5e3fead403
pkgdesc='Python library for controlling YeeLight RGB bulbs'
arch=('any')
url='https://gitlab.com/stavros/python-yeelight'
license=('BSD')
depends=('python-ifaddr' 'python')
makedepends=(
  'git'
  'python-flit-core'
  'python-build'
  'python-installer'
#  'python-wheel'
#  'python-sphinx'
#  'python-sphinx_rtd_theme'
)
changelog=CHANGELOG.md
source=("$pkgname::git+$url#commit=$_commit?signed")
  sha256sums=('71c086355655d50e1bf10e60abab59ceadfa284eb91d44e662e08b0f903e5726')
validpgpkeys=('3D2E921F15667F0FD5B3017E26EA345ECD4C2A63')

build() {
  cd "$pkgname"
  PYTHONPATH=./ python -m build --wheel --skip-dependency-check --no-isolation
  cd docs
#  PYTHONPATH=../ make man
}

package() {
  export PTYHONHASHSEED=0
  cd "$pkgname"
  python -m installer --destdir="$pkgdir/" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
#  install -Dm644 docs/build/man/yeelight.1 -t "$pkgdir/usr/share/man/man1/"
}

# vim: ts=2 sw=2 et:
