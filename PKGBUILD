# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Ronuk Raval <ronuk.raval at gmail dot com>

pkgname=python-pscript
pkgver=0.7.6
pkgrel=1
pkgdesc='Python to JavaScript compiler'
arch=('any')
url='https://github.com/flexxui/pscript'
license=('BSD')
depends=('python')
makedepends=('python-setuptools' 'python-sphinx')
changelog=releasenotes.rst
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1bc8b5c1319e677837df5659289f14052c84da977c445acde95bf1ada653a6c5')

build() {
  cd "pscript-$pkgver"
  python setup.py build
  cd docs
  make man
}

package() {
  cd "pscript-$pkgver"
  PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 docs/_build/man/PScript.1 "$pkgdir/usr/share/man/man1/pscript.1"
}

# vim: ts=2 sw=2 et:
