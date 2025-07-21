# Maintainer: stabldev <thestabldev@gmail.com>

pkgname=torrra
pkgver=1.1.0
pkgrel=2
pkgdesc="A Python tool that lets you find and download torrents without leaving your CLI."
arch=('any')
url="https://github.com/stabldev/torrra"
license=('MIT')
depends=(
  'libtorrent-rasterbar'
  'python'
  'python-diskcache'
  'python-httpx'
  'python-platformdirs'
  'python-textual'
  'python-tomli-w'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("https://files.pythonhosted.org/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('6f6ad553c857008a57b534001e0bcb851fb307fdc882a920afa841273a56296d')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
