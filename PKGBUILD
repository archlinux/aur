# Maintainer: matt-shearing <matt-shearing@users.noreply.github.com>
pkgname=voxtype-tray
pkgver=1.2.3
pkgrel=1
pkgdesc="System tray app and settings GUI for VoxType voice dictation (PyQt6)"
arch=('any')
url="https://github.com/matt-shearing/voxtype-tray"
license=('MIT')
depends=(
    'python'
    'python-pyqt6'
    # Unversioned: the voxtype-bin / voxtype-cuda providers declare an
    # unversioned `provides=('voxtype')`, which pacman cannot match against a
    # versioned dependency (e.g. `voxtype>=0.7.2`) — doing so breaks install
    # for everyone not on the source `voxtype` package. v0.7.2+ is recommended
    # for streaming/Parakeet/MIGraphX features surfaced by the GUI.
    'voxtype'
)
optdepends=(
    'dotool: keyboard simulation for KDE Plasma Wayland (recommended)'
    'wtype: keyboard simulation for Sway/wlroots compositors'
    'wl-clipboard: clipboard fallback support'
    'polkit: required for in-GUI backend switching and MIGraphX wrapper install'
    'migraphx: AMD GPU acceleration for ONNX engines (Parakeet, etc.)'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/matt-shearing/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('79725df51c7cb857065f0d4f7607a2199bb8dedebebd6e2dcb02e5ae5f935336')

package() {
    cd "${pkgname}-${pkgver}"

    # Install main script
    install -Dm755 voxtype-tray.py "${pkgdir}/usr/bin/voxtype-tray"

    # Desktop entry (app menu + autostart)
    install -Dm644 voxtype-tray.desktop "${pkgdir}/usr/share/applications/voxtype-tray.desktop"
    install -Dm644 voxtype-tray.desktop "${pkgdir}/etc/xdg/autostart/voxtype-tray.desktop"

    # License
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
