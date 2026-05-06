# Maintainer: Rockykln <contact@rockykln.com>

pkgname=refrain
pkgver=0.1.4
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
sha256sums=('62154b725086f441728ed08b807cee9963466c89f100b0a7d8e52985b36c9949')

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
