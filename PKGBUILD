# Maintainer: myuki <mioki dot cinnamon650 at 8shield dot net>

_pkgname=metacubexd-desktop
pkgname=${_pkgname}-bin
pkgver=1.273.0
pkgrel=1
pkgdesc="MetaCubeXD Official Desktop Client (Precompiled version)"
arch=('x86_64' 'aarch64')
url="https://github.com/MetaCubeX/metacubexd"
license=('MIT')
depends=(
    'alsa-lib'
    'at-spi2-core'
    'cairo'
    'dbus'
    'expat'
    'glib2'
    'glibc'
    'gtk3'
    'hicolor-icon-theme'
    'libcups'
    'libgcc'
    'libx11'
    'libxcb'
    'libxcomposite'
    'libxdamage'
    'libxext'
    'libxfixes'
    'libxkbcommon'
    'libxrandr'
    'mesa'
    'nspr'
    'nss'
    'pango'
    'systemd-libs'
)
provides=("${_pkgname}")
conflicts=(
    "${_pkgname}"
    "${_pkgname}-electron"
    "${_pkgname}-electron-bin"
)

source=("LICENSE::${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x64.pacman::${url}/releases/download/v${pkgver}/MetaCubeXD-${pkgver}-linux-x64.pacman")
source_aarch64=("${pkgname}-${pkgver}-aarch64.pacman::${url}/releases/download/v${pkgver}/MetaCubeXD-${pkgver}-linux-aarch64.pacman")

b2sums=('e054b16548c555ae5bb461e634f18fd48956f976dbe546e6b0dae65954f12e19c99fa3f3b41fdb4faf5b9959266366e2430774d9bc072b22b09fffa09d231e37')
b2sums_x86_64=('b6dc04b2be98517cbe36739a1c44f057a5086dd77a5db9b1f78d30f83df9c710b1a8ab370ef6c2a16c8644a329a1bad21f80875ac36230a91501c3d5632e0ec4')
b2sums_aarch64=('5de3e4cca83eb435df4584f38f60ae648557fd00dbb993718ae2e159ce43f4a6f59be2c491fce8adb21d83f894d7a501530a5413a77cc4c9434ba3fb14f8cbfc')

package() {
    cp -r "${srcdir}/opt" "${pkgdir}/"
    cp -r "${srcdir}/usr" "${pkgdir}/"

    install -dm755 "${pkgdir}/usr/bin"
    ln -sf "/opt/MetaCubeXD/metacubexd" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "${srcdir}/LICENSE"
    ln -sf "/opt/MetaCubeXD/LICENSE.electron.txt" "${pkgdir}/usr/share/licenses/${pkgname}/"
    ln -sf "/opt/MetaCubeXD/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/"
}
