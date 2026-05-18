# Maintainer: Lilly <lilly@hibana.me>
pkgname=launchy-steam
pkgver=0.1.4
pkgrel=1
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
sha256sums=('1ff22329ec8047928171ea2685a9f080116ea3e39f12d6b862316ae3b365ce60'
            'd13b6296dec6a269c079bfa0644b5e3ed232ac0e51cb07010c3f624e6f4cfc21')

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
