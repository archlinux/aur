# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-pytest-isort
pkgver=3.1.0
pkgrel=1
pkgdesc='pytest plugin to perform isort checks (import ordering)'
arch=('any')
license=('BSD')
url='https://github.com/moccu/pytest-isort'
depends=('python38-pytest' 'python38-isort')
makedepends=('python38-build' 'python38-installer' 'python38-poetry-core')
source=("https://github.com/moccu/pytest-isort/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('a01799b832783301818aba5d441cdb9167a367e2c434df9790e4b2d839a9cdab03683736f43339a07ef4444ca0bddfb1b6cd503db170b6544f8c14617e7398df')

build() {
  cd pytest-isort-$pkgver
  python3.8 -m build -nw
}

check() {
  # Hack entry points by installing it

  cd pytest-isort-$pkgver
  python3.8 -m installer --destdir="$PWD/tmp_install" dist/*.whl
  PYTHONPATH="$PWD/tmp_install/usr/lib/python3.8/site-packages:$PYTHONPATH" pytest
}

package() {
  cd pytest-isort-$pkgver
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.rst -t "$pkgdir"/usr/share/licenses/$pkgname/
  rm "$pkgdir"/usr/lib/python3.8/site-packages/LICENSE.rst
}

# vim:set ts=2 sw=2 et:
