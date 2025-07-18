# Maintainer: stabldev <thestabldev@gmail.com>

pkgname=torrra
pkgver=1.0.0
pkgrel=1
pkgdesc="A Python tool that lets you find and download torrents without leaving your CLI."
arch=('any')
url="https://github.com/stabldev/torrra"
license=('MIT')
depends=(
  'python'
  'python-httpx'
  'libtorrent-rasterbar'
  'python-platformdirs'
  'python-textual'
  'python-tomli-w'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("https://files.pythonhosted.org/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('036087449875e7d7e76518b01ff878b80c5f1691f8e7b2d28afb6366a9a4ac14')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
