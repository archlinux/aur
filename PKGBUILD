# Maintainer: Rockykln <contact@rockykln.com>

pkgname=refrain
pkgver=0.2.2
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
sha256sums=('db07e0783b3f44a7c54d4b8ee2ebe33f3dc577707a03bd42f5958ddae3d5ac12')

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
