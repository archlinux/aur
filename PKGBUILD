# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: tsipizic

pkgname=python-yeelight
pkgver=0.7.8
pkgrel=2
_commit=40c09bd4
pkgdesc='Python library for controlling YeeLight RGB bulbs'
arch=('any')
url='https://gitlab.com/stavros/python-yeelight'
license=('BSD')
depends=('python-future' 'python-ifaddr')
makedepends=('git' 'python-setuptools' 'python-sphinx' 'python-sphinx_rtd_theme')
changelog=CHANGELOG.md
source=("$pkgname::git+$url#commit=$_commit?signed")
sha256sums=('SKIP')
validpgpkeys=('3D2E921F15667F0FD5B3017E26EA345ECD4C2A63')

build() {
  cd "$pkgname"
  python setup.py build
  cd docs
  PYTHONPATH=../ make man
}

package() {
  cd "$pkgname"
  PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 docs/build/man/yeelight.1 -t "$pkgdir/usr/share/man/man1/"
}

# vim: ts=2 sw=2 et:
