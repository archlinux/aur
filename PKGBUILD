# Maintainer: envolution
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=python-pyshortcuts
pkgver=1.9.5
pkgrel=2
pkgdesc="Create desktop shortcuts to Python scripts"
arch=('any')
url="https://github.com/newville/pyshortcuts"
license=('MIT')
depends=('python')
makedepends=(
  'python-setuptools-scm'
  'python-build'
  'python-installer'
  'python-wheel')
optdepends=('python-wxpython: for GUI')
source=(
  "$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/pyshortcuts/pyshortcuts-$pkgver.tar.gz"
  "PyShortcut.desktop")
sha256sums=('49dbb4c3f032ad4f6c54ba4c84bf7ef32c5538422191924281597278bbb6913c'
            'c243510caaf511a17ee62c89080dfa386a9d2de36eaa937c56de5a97c228ec82')

build() {
  cd "pyshortcuts-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  export PYTHONHASHSEED=0
  cd "pyshortcuts-$pkgver"
  python -m installer --destdir="$pkgdir/" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 pyshortcuts/icons/ladder.png "$pkgdir/usr/share/pixmaps/pyshortcuts.png"
  install -Dm644 "$srcdir/PyShortcut.desktop" -t "$pkgdir/usr/share/applications/"
}
# vim:set ts=2 sw=2 et:
