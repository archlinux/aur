# Maintainer: vaishnav <vaishnav.sabari.girish@gmail.com>

pkgname=pawnix
pkgver=0.1.1
pkgrel=1
pkgdesc='Keyboard-first terminal chess client with local play and Lichess support'
arch=('any')
url='https://github.com/a-shygun/Pawnix'
license=('MIT')
depends=(
  'python>=3.10'
  'python-chess'
  'python-keyring' # OS credential store for Lichess OAuth tokens
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools' # swap for python-hatchling / python-flit-core if pyproject.toml says so
  'python-wheel'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP') # run `updpkgsums` to fill this in

build() {
  cd "Pawnix-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "Pawnix-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
