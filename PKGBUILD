# # Maintainer: hengtseChou <hankthedev@gmail.com>

pkgname=niriswitcher
pkgver=0.5.2
pkgrel=1
pkgdesc="An application switcher for niri"
arch=('any')
url="https://github.com/isaksamsten/niriswitcher"
license=('MIT')
depends=(
    'python'
    'python-gobject'
    'niri'
    'gtk4'
    'gtk4-layer-shell'
    'libadwaita'
)
makedepends=(
    'python-hatchling'
    'python-build'
    'python-installer'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('SKIP')  # Replace with actual checksum if publishing

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    # License and docs
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
