# Maintainer:
# Contributor: j.r <j.r@jugendhacker.de>

_pkgname="python-telegram"
pkgname="$_pkgname"
pkgver=0.19.0
pkgrel=1
pkgdesc="Python API for the tdlib library"
url="https://github.com/alexander-akhmetov/python-telegram"
license=('MIT')
arch=('x86_64')

depends=(
  'python'

  ## AUR
  'libtd'
  'python-telegram-text'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)

conflicts=('python-telegram-bot')

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/archive/$pkgver.$_pkgext")
sha256sums=('dbd7a1bf313465f5fdcfd774737b197fbc3836821a4e5c57bf3fc1528d9247e0')

build() {
  cd "$_pkgsrc"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
