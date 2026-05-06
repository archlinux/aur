# Maintainer: Rockykln <contact@rockykln.com>

pkgname=refrain
pkgver=0.2.0
pkgrel=1
pkgdesc="Discord Rich Presence for Apple Music on Linux"
arch=('any')
url="https://github.com/Rockykln/refrain"
license=('custom:Refrain')
depends=(
    'python>=3.11'
    'python-pypresence'
    'python-dbus'
    'pyside6'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-hatchling'
    'python-wheel'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Rockykln/refrain/archive/v$pkgver.tar.gz")
sha256sums=('d88df042b1ce2d403c65a3c0c6883f0de4eda038c5f44e1fb8f4d5b54bddd5cf')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 src/refrain/assets/refrain.desktop \
        "$pkgdir/usr/share/applications/refrain.desktop"
    install -Dm644 src/refrain/assets/icons/refrain.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/refrain.svg"
    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md \
        "$pkgdir/usr/share/doc/$pkgname/README.md"
}
