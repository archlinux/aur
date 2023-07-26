# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-aeppl
_name=${pkgname#python-}
pkgver=0.1.5
pkgrel=1
pkgdesc="Tools for an Aesara-based PPL"
arch=(any)
url="https://github.com/aesara-devs/aeppl"
license=(MIT)
depends=(
  python
  python-aesara
  python-numpy
  python-sympy
  python-typing_extensions
)
makedepends=(
  python-build
  python-installer
  python-wheel
)
checkdepends=(
  python-numdifftools
  python-pytest
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('51991576033f4036e73429504b5f830f1ee63db50eeead2e9966f55969581992')

_archive="$_name-$pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  python -m pytest
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
