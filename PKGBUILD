# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Ronuk Raval <ronuk.raval at gmail dot com>

pkgname=python-dialite
pkgver=0.5.3
pkgrel=3
pkgdesc='Lightweight pure-Python package to show simple dialogs'
arch=('any')
url='https://github.com/flexxui/dialite'
license=('BSD')
depends=('python')
makedepends=('python-setuptools' 'python-sphinx')
checkdepends=('python-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('327b172a722b05b63d1427d110cf431c4de260c7d48bcac8fa312369ab1e79c2')

build() {
  cd "dialite-$pkgver"
  python setup.py build
  cd docs
  make man
}

check() {
  cd "dialite-$pkgver"
  python setup.py pytest
}

package() {
  cd "dialite-$pkgver"
  PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm 644 docs/_build/man/Dialite.1 "$pkgdir/usr/share/man/man1/dialite.1"
}

# vim: ts=2 sw=2 et:
