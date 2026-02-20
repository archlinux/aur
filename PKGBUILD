# Maintainer: ii-shimul <https://github.com/ii-shimul>
pkgname=subdowner
pkgver=1.0.1
pkgrel=1
pkgdesc="GTK4/Libadwaita subtitle search & download tool"
arch=('any')
url="https://github.com/ii-shimul/subdowner"
license=('MIT')
depends=(
    'python'
    'python-gobject'
    'gtk4'
    'libadwaita'
    'python-requests'
    'subliminal'
    'python-chardet'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('821fdc95b02c1f926317b22b35519cef5020a538ec779337bae080e2a63c069c')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"

    # Install the Python package
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Desktop entry
    install -Dm644 data/io.github.subdowner.desktop \
        "$pkgdir/usr/share/applications/io.github.subdowner.desktop"

    # Icon
    install -Dm644 data/io.github.subdowner.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.subdowner.svg"

    # AppStream metadata
    install -Dm644 data/io.github.subdowner.metainfo.xml \
        "$pkgdir/usr/share/metainfo/io.github.subdowner.metainfo.xml"

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
