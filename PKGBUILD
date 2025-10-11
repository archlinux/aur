
# Maintainer: Your Name <you@example.com>
pkgname=dms-shell-bin
pkgver=0.1.11
pkgrel=1
pkgdesc='Desktop shell for wayland compositors built with Quickshell & GO'
arch=('x86_64' 'aarch64')
url='https://github.com/AvengeMedia/DankMaterialShell'
license=('GPL-3.0-only')
depends=(
    'quickshell'
    'dgop'
    'ttf-material-symbols-variable-git'
    'inter-font'
    'ttf-fira-code'
)
optdepends=(
    'networkmanager: Required for network management'
    'matugen-bin: Dynamic wallpaper-based theming'
    'brightnessctl: Laptop display brightness control'
    'wl-clipboard: Copy functionality for PIDs and other elements'
    'cliphist: Clipboard history functionality'
    'cava: Audio visualizer'
    'qt5ct: Qt5 application theming'
    'qt6ct: Qt6 application theming'
)
provides=('dms')
conflicts=('dms-shell-git' 'dms-shell' 'dms-git')

_get_arch() {
    case "$1" in
        x86_64) echo "amd64" ;;
        aarch64) echo "arm64" ;;
        *) echo "unsupported" ;;
    esac
}

source_x86_64=(
    "dms-full-amd64-${pkgver}.tar.gz::$url/releases/download/v$pkgver/dms-full-amd64.tar.gz"
)
source_aarch64=(
    "dms-full-arm64-${pkgver}.tar.gz::$url/releases/download/v$pkgver/dms-full-arm64.tar.gz"
)

sha256sums_x86_64=(
    '6bf2b3356d362319130ca9e55133729014ff4594f2c5a31830d9fd78b95f9710'
)

sha256sums_aarch64=(
    '61abb87e3b53fd59912e63ca8c72f343458a01ff610216d27f6636856b55564a'
)

package() {
    install -Dm755 "${srcdir}/bin/dms" "$pkgdir/usr/bin/dms"

    install -dm755 "$pkgdir/etc/xdg/quickshell"
    cp -r "${srcdir}/dms" "$pkgdir/etc/xdg/quickshell/"

    # Install documentation from dms folders
    if [ -f "${srcdir}/dms/README.md" ]; then
        install -Dm644 "${srcdir}/dms/README.md" "$pkgdir/usr/share/doc/dms/README.md"
    fi
    if [ -d "${srcdir}/dms/docs" ]; then
        install -dm755 "$pkgdir/usr/share/doc/dms/"
        cp -r "${srcdir}/dms/docs"/* "$pkgdir/usr/share/doc/dms/"
    fi
    if [ -f "${srcdir}/dms/PLUGINS/README.md" ]; then
        install -Dm644 "${srcdir}/dms/PLUGINS/README.md" "$pkgdir/usr/share/doc/dms/plugins.md"
    fi
}
