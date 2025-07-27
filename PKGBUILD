# Maintainer: stabldev <thestabldev@gmail.com>

pkgname=torrra
pkgver=1.2.3
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
sha256sums=('064d72e80338212b4b5787e5d9fe230b57496446c5056585d50e5357d40d7fd3')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
