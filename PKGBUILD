# Maintainer: stabldev <thestabldev@gmail.com>

pkgname=torrra
pkgver=1.2.1
pkgrel=1
pkgdesc="A Python tool that lets you find and download torrents without leaving your CLI."
arch=('any')
url="https://github.com/stabldev/torrra"
license=('MIT')
depends=(
  'libtorrent-rasterbar'
  'python'
  'python-click'
  'python-diskcache'
  'python-httpx'
  'python-platformdirs'
  'python-textual'
  'python-tomli-w'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("https://files.pythonhosted.org/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('ebf3fd99fc058addc8f5146614984242b7fb17c72e46a1eceacb496f41f20049')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
