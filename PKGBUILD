pkgname=elgato-keylight-tui
pkgver=0.1
pkgrel=1
pkgdesc='Terminal UI and CLI for controlling Elgato Key Light devices'
arch=('any')
url='https://github.com/shrimpsizemoose/elgato-keylight-tui'
license=('WTFPL')
depends=(
  'python'
  'python-httpx'
  'python-textual'
  'python-typer'
  'python-zeroconf'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-hatchling'
)
checkdepends=(
  'python-pytest'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9719368c2c07a1b22b022238c21bef334297a94c433d67b01c7c447785de3173')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname-$pkgver"
  pytest tests
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
