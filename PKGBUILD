# Maintainer: thongor77 <magetriste@proton.me>
pkgname=wifimaplinux
pkgver=2.0.1
pkgrel=1
pkgdesc='Multi-floor residential Wi-Fi mapping tool for Linux'
arch=(any)
url='https://github.com/thongor77/WifiMapLinux'
license=(MIT)
depends=(
    python
    pyside6
    python-numpy
    python-pillow
    python-sqlmodel
    iw
)
makedepends=(
    python-build
    python-installer
    python-hatchling
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('3f490338af8edf927c17f6fb7c0c625bcbc13c221a3ec3665929ba12faca5688')

build() {
    cd "WifiMapLinux-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "WifiMapLinux-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 share/wifimaplinux.desktop \
        "${pkgdir}/usr/share/applications/wifimaplinux.desktop"
    install -Dm644 share/wifimaplinux.svg \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/wifimaplinux.svg"
    install -Dm644 LICENSE \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
