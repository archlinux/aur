pkgbase=eim-bin
pkgname=('eim-cli' 'eim-gui')
pkgver=0.12.0
pkgrel=1
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/espressif/idf-im-ui"
license=('Apache-2.0')
depends=('ccache' 'dfu-util')
makedepends=('unzip')
options=('!strip')

_icon_url="https://raw.githubusercontent.com/espressif/idf-im-ui/master/src-tauri/icons/icon.png"

source=("eim-gui.desktop")
sha256sums=('SKIP')

source_x86_64+=("cli-x64.zip::${url}/releases/download/v${pkgver}/eim-cli-linux-x64.zip"
                "gui-x64.zip::${url}/releases/download/v${pkgver}/eim-gui-linux-x64.zip"
                "icon.png::${_icon_url}")
source_aarch64+=("cli-arm64.zip::${url}/releases/download/v${pkgver}/eim-cli-linux-aarch64.zip"
                 "gui-arm64.zip::${url}/releases/download/v${pkgver}/eim-gui-linux-aarch64.zip"
                 "icon.png::${_icon_url}")
source_armv7h+=("cli-armv7.zip::${url}/releases/download/v${pkgver}/eim-cli-linux-armv7.zip")

noextract=("cli-x64.zip" "gui-x64.zip" "cli-arm64.zip" "gui-arm64.zip" "cli-armv7.zip")

sha256sums_x86_64=('23c794dcb470466e7250e56b0148c2cd009cf603620cecf9ff07c73ea31b9dfe'
                   '2e77c6258ad2225746077e1196b226d47ce1592f95b840ca995fc5e890230fac'
                   'SKIP')
sha256sums_aarch64=('ed906a0e0cbecc23da4e45f4be6dcda34eb5c90960f6dbf540b30d7423b2e3e9'
                    '3cc79c124dc8bf9130a8f00f450ee97c78bf347b46b106ea8dd39a170f9db02e'
                    'SKIP')
sha256sums_armv7h=('97a95f1032918e51e207293cf178069d888b0947c50a22ecc760cc08966d4b09')

package_eim-cli() {
    pkgdesc="ESP-IDF installation manager (CLI)"
    provides=('eim')
    conflicts=('eim')

    unzip -p cli-*.zip eim > eim-cli
    install -Dm755 eim-cli "${pkgdir}/usr/bin/eim"
}

package_eim-gui() {
    pkgdesc="ESP-IDF installation manager (GUI)"
    provides=('eim-gui')
    conflicts=('eim-gui')
    depends+=('webkit2gtk-4.1')
    arch=('x86_64' 'aarch64')

    unzip -p gui-*.zip eim > eim-gui
    install -Dm755 eim-gui "${pkgdir}/usr/bin/eim-gui"
    install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/eim-gui.png"
    install -Dm644 "${srcdir}/eim-gui.desktop" "${pkgdir}/usr/share/applications/eim-gui.desktop"
}