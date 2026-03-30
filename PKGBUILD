# Maintainer: Marc <marc1326@users.noreply.github.com>

pkgname=anvil-organizer
pkgver=1.2.6
pkgrel=1
pkgdesc="Native Linux Mod Manager inspired by Mod Organizer 2"
arch=('x86_64')
url="https://github.com/Marc1326/Anvil-Organizer"
license=('GPL-3.0-or-later')
depends=(
    'python>=3.11'
    'python-pyside6'
    'python-lz4'
    'qt6-base'
    'hicolor-icon-theme'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "Anvil-Organizer-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "Anvil-Organizer-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Desktop entry
    install -Dm644 anvil-organizer.desktop \
        "$pkgdir/usr/share/applications/anvil-organizer.desktop"

    # Icons
    install -Dm644 anvil/resources/logo.png \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/anvil-organizer.png"
    install -Dm644 anvil/resources/logo.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/anvil-organizer.svg"

    # License
    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
