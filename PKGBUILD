# Maintainer: Lilly <lilly@hibana.me>
pkgname=launchy-steam
pkgver=0.1.2
pkgrel=2
pkgdesc="Configurable Steam compatibility tool launcher with per-game settings UI"
arch=('any')
url="https://github.com/Chloe-ko/launchy"
license=('GPL3')
depends=(
    'python>=3.11'
    'python-gobject'
    'gtk4'
    'libadwaita'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Chloe-ko/launchy/archive/v${pkgver}.tar.gz"
        "launchy-steam.install")
sha256sums=('dd9163e4cc89241c9c23fc2ff7a3b4913a552efd3fe3ee2e347b2938caf6b1db'
            'fd719dc6b1de8b385e1ad03054778e584466d1dbeabb65a7ef51b6d968c912bf')

build() {
    cd "Launchy-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "Launchy-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 launchy/logo.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/launchy.svg"
    install -Dm644 launchy.desktop "$pkgdir/usr/share/applications/launchy.desktop"

    # Reference VDF (the Python launcher writes this itself, but useful for reference)
    install -Dm644 data/compatibilitytool.vdf "$pkgdir/usr/share/launchy/compatibilitytool.vdf"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
