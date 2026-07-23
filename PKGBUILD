pkgname='mesh-client'
pkgver=5.24.1
pkgrel=1
pkgdesc='Cross-platform Electron desktop client for Meshtastic, MeshCore, and Reticulum (LXMF) on macOS, Linux, and Windows with BLE, USB serial, Wi-Fi/TCP, MQTT, local SQLite history, routing diagnostics, and 16-language UI.'
arch=('x86_64')
url='https://github.com/Colorado-Mesh/mesh-client'
license=('MIT')
options=(!strip !debug)
depends=(
    'gtk3'
    'nss'
    'nspr'
    'at-spi2-core'
    'libxcomposite'
    'libxdamage'
    'libxrandr'
    'libxkbcommon'
    'alsa-lib'
    'dbus'
    'cups'
)
_deb_package="mesh-client_5.24.1_amd64.deb"
source=("$_deb_package::https://github.com/Colorado-Mesh/mesh-client/releases/download/v5.24.1/$_deb_package")
md5sums=('1c8997efa68f482bf3669b48a650989f')
package() {
    cd "$srcdir"
    ar x "$_deb_package"
    tar xf data.tar.xz -C "$pkgdir"

    find "$pkgdir/opt/Mesh-client/resources/app.asar.unpacked/node_modules" \
        -type d \
        \( \
            -name "android-*" \
            -o -name "linux-arm*" \
            -o -name "linux-ia32" \
            -o -name "linux-x86" \
            -o -name "darwin-*" \
            -o -name "win32-*" \
        \) \
        -prune -exec rm -rf {} +

    rm -rf "$pkgdir/opt/Mesh-client/resources/reticulum-sidecar/staged/linux-arm64"

    find "$pkgdir/opt/Mesh-client/resources/app.asar.unpacked/node_modules" \
        -name "*.musl.node" \
        -delete
}
