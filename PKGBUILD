# Maintainer: Ahmet Diler <ahmet.diler@hotmail.de>
pkgname=md-viewer-bin
pkgver=0.1.11
pkgrel=1
pkgdesc="Fast, lightweight markdown viewer for Linux with tabs, file explorer, and live reload (prebuilt binary)"
arch=('x86_64')
url="https://github.com/aydiler/md-viewer"
license=('MIT')
# Runtime deps are kept identical to md-viewer-git. ldd on the binary only
# shows libc/libm/libgcc_s linked directly; everything else (xcb, xkbcommon,
# openssl, gtk3, fontconfig, dbus) is dlopen'd at runtime by winit/rfd/zbus,
# so ldd cannot validate the dep set. Match the source-build PKGBUILD verbatim.
depends=(
    'gcc-libs'
    'libxcb'
    'libxkbcommon'
    'openssl'
    'gtk3'
    'fontconfig'
    'dbus'
)
optdepends=(
    'zenity: native file dialogs'
    'xdg-desktop-portal: file dialogs on Wayland'
    'xdg-desktop-portal-gtk: GTK portal backend'
)
provides=('md-viewer')
conflicts=('md-viewer' 'md-viewer-git')
source=(
    "md-viewer-${pkgver}-linux-x86_64.tar.gz::https://github.com/aydiler/md-viewer/releases/download/v${pkgver}/md-viewer-${pkgver}-linux-x86_64.tar.gz"
    "md-viewer.desktop::https://raw.githubusercontent.com/aydiler/md-viewer/v${pkgver}/data/md-viewer.desktop"
    "io.github.aydiler.md-viewer.png::https://raw.githubusercontent.com/aydiler/md-viewer/v${pkgver}/data/io.github.aydiler.md-viewer.png"
    "LICENSE::https://raw.githubusercontent.com/aydiler/md-viewer/v${pkgver}/LICENSE"
)
sha256sums=(
    '0b8c94f362544e8f621459c74738533f8d3d35baa167fd9af60e650800c63511'
    '7d786706389bf20531f1e2ace18bc1d2057b1745c059df6e804695cbbc8fe69c'
    '46d7a5b2a50e845d8c63146441914d37df5c411036a22d5412f1844126330b1b'
    '1a12042bdcb8eb609fd272b10a1dac618aec3aebdae90f5dd49af264a358444e'
)

package() {
    install -Dm755 "${srcdir}/md-viewer" \
        "${pkgdir}/usr/bin/md-viewer"
    install -Dm644 "${srcdir}/md-viewer.desktop" \
        "${pkgdir}/usr/share/applications/md-viewer.desktop"
    install -Dm644 "${srcdir}/io.github.aydiler.md-viewer.png" \
        "${pkgdir}/usr/share/pixmaps/io.github.aydiler.md-viewer.png"
    install -Dm644 "${srcdir}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
