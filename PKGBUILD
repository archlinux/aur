# Maintainer: matt-shearing <matt-shearing@users.noreply.github.com>
pkgname=voxtype-tray
pkgver=1.2.2
pkgrel=2
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
sha256sums=('f76dacd0e73e00ca7d01c444902386f18572bb2d8b52f6fbc93f32f70f61f42f')

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
