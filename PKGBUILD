
# Maintainer: Avenge Media LLC <avengemediallc at gmail dot com>
pkgname=dms-shell-bin
pkgver=0.3.2
pkgrel=1
pkgdesc='Desktop shell for wayland compositors built with Quickshell & GO'
arch=('x86_64' 'aarch64')
url='https://github.com/AvengeMedia/DankMaterialShell'
license=('GPL-3.0-only')
depends=(
    'quickshell'
    'dgop'
    'accountsservice'
)
optdepends=(
    'matugen-bin: Dynamic wallpaper-based theming'
    'brightnessctl: Laptop display brightness control'
    'dsearch-bin: Filesystem search'
    'wl-clipboard: Copy functionality for PIDs and other elements'
    'cliphist: Clipboard history functionality'
    'cava: Audio visualizer'
    'qt6-multimedia: Sound effect support'
    'power-profiles-daemon: Set power profile'
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

sha256sums_x86_64=('080bc1121a09a37d30cf9e851be62e66ad0039cf209155bf318c27ab1b4b6643')
sha256sums_aarch64=('c29c64ad349fad9bd40d0658d7e2699ef6317adf133ebdd4ba9f3822eda2a6bf')

package() {
    install -Dm755 "${srcdir}/bin/dms-distropkg" "$pkgdir/usr/bin/dms"

    install -dm755 "$pkgdir/usr/share/quickshell"
    cp -r "${srcdir}/dms" "$pkgdir/usr/share/quickshell/"

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
