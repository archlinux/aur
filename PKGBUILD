# Maintainer: David Runge <dvzrv@archlinux.org>

_name=click-command-tree
pkgname=python-click-command-tree
pkgver=1.2.0
pkgrel=1
pkgdesc="Click plugin to show the command tree of your CLI"
arch=(any)
url="https://github.com/whwright/click-command-tree"
license=(MIT)
depends=(
  python
  python-click
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('1c689898bb393bf1bdd88b91b11215a0a134142a5e7988ada7012a94c1b8c8bd')
b2sums=('f57802bf3ceb3596d4d06af00a360d295b7aeaab627c9e50129a66e038329252552710c1ba50c68bc623c3a169d5ffe5d3ef42f9db78671633bd40419aeb486f')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  pytest -vv tests.py
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
