# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=dotbot
pkgver=1.19.1
pkgrel=2
pkgdesc="A tool that bootstraps your dotfiles"
arch=(any)
url="https://github.com/anishathalye/dotbot"
license=(MIT)
depends=(
  python
  python-yaml
  python-setuptools
  python-importlib-metadata
)
checkdepends=(python-pytest)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('235a7a7c239de895cae150ff25d7dbec893ea23ba91376aa6860b3bd709cccec')

_archive="$pkgname-$pkgver"

build() {
  cd "$_archive"

  python setup.py build
}

check() {
  cd "$_archive"

  python -m pytest --ignore tests/test_shim.py
}

package() {
  cd "$_archive"

  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
