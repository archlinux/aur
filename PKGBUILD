# Maintainer: stabldev <thestabldev@gmail.com>

pkgname=torrra
pkgver=0.2.3
pkgrel=2
pkgdesc="A Python tool that lets you find and download torrents without leaving your CLI."
arch=('any')
url="https://github.com/stabldev/torrra"
license=('MIT')
depends=(
  'python'
  'python-httpx'
  'libtorrent-rasterbar'
  'python-platformdirs'
  'python-questionary'
  'python-rich'
  'python-selectolax'
  'python-tomli-w'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("https://files.pythonhosted.org/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('8a2b5adfe80eac9bef3f4013d04487633f4e91a8c6a1c6873169127a3ca4260c')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
