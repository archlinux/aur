# Maintainer: myuki <mioki dot cinnamon650 at 8shield dot net>

_pkgname=metacubexd-desktop
pkgname=${_pkgname}-bin
pkgver=1.270.2
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
b2sums_x86_64=('aa9f6754f71f2c62e038c71d27ddbe2dd42d0e33d5c7c3086b155656429dfbb92220a581b6f2765af897d5d9f520efab0ec6a4e7fe4131c4b668ee95f30aad1a')
b2sums_aarch64=('e400bd57c509b58900f9546ac7764e715ddea21e434bd3a315c9765ed29844dfe5f2d967db48e2eb1daaa889dae27da05fd3c5311f7e0ee45396cce72df0efef')

package() {
    cp -r "${srcdir}/opt" "${pkgdir}/"
    cp -r "${srcdir}/usr" "${pkgdir}/"

    install -dm755 "${pkgdir}/usr/bin"
    ln -sf "/opt/MetaCubeXD/metacubexd" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "${srcdir}/LICENSE"
    ln -sf "/opt/MetaCubeXD/LICENSE.electron.txt" "${pkgdir}/usr/share/licenses/${pkgname}/"
    ln -sf "/opt/MetaCubeXD/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/"
}
