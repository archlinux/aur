# Maintainer: Danny McClelland <danny@dannymcclelland.com>

pkgname=hibob-tui
pkgver=0.1.0
pkgrel=1
pkgdesc="A terminal user interface for browsing and searching HiBob employee directory"
arch=('any')
url="https://github.com/dannymcc/hibob-tui"
license=('MIT')
depends=(
    'python'
    'python-textual'
    'python-requests'
    'python-rich'
)
optdepends=(
    'wl-clipboard: clipboard support on Wayland'
    'xclip: clipboard support on X11'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-hatchling'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/dannymcc/hibob-tui/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6171f1e42f0473a9862a0c1081a2b3fbf7b180877b8805dbffaea5134f68a0c4')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
