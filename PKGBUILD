# Maintainer:
# Contributor: j.r <j.r@jugendhacker.de>

## links
# https://telegram-text.alinsky.tech/
# https://github.com/SKY-ALIN/telegram-text

## basic info
_module="telegram-text"
_pkgname="python-$_module"
pkgname="$_pkgname"
pkgver=0.2.0
pkgrel=2
pkgdesc="Python markup module for Telegram messenger"
url="https://github.com/SKY-ALIN/telegram-text"
license=('MIT')
arch=('any')

depends=(
  'python'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-poetry'
)
checkdepends=(
  'python-pytest'
)

_pkgsrc="$_module-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/archive/refs/tags/v$pkgver.$_pkgext")
sha256sums=('1af4e5487858dcc2576946524193f97e0638335c0b307ef3f2adfc6bebde0192')

build() {
  cd "$_pkgsrc"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgsrc"
  pytest tests/
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
