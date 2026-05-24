# Maintainer: Manjot Kaur <manjotkaur2074@gmail.com>
pkgname=inlinea
pkgver=0.1.0
pkgrel=1
pkgdesc="A native, Linux-first annotation-focused PDF editor"
arch=('any')
url="https://github.com/kaurmanjot20/inlinea"
license=('MIT')
depends=(
    'python'
    'python-gobject'
    'python-cairo'
    'python-pymupdf'
    'gtk4'
    'libadwaita'
    'poppler-glib'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/kaurmanjot20/inlinea/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9cf7722465fc7b910c30b3e58155e9cd22029ca5a31fdd09c7bb8abea7254347')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Desktop entry
    install -Dm644 data/com.inlinea.app.desktop \
        "$pkgdir/usr/share/applications/com.inlinea.app.desktop"

    # Icon
    install -Dm644 data/icons/inlinea.png \
        "$pkgdir/usr/share/icons/hicolor/512x512/apps/inlinea.png"

    # License
    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

