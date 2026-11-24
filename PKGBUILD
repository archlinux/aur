# Maintainer: myuki <mioki dot cinnamon650 at 8shield dot net>

_pkgname=metacubexd-desktop
pkgname=${_pkgname}-bin
pkgver=1.277.0
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
b2sums_x86_64=('b75f10de3133f65d83d1fa9cf1edf9808d2a268e613a09d77593e3de836193b48c2e4fffd633d911b59b2cc48e6681e6d75f276e9e68c4487b94074a1f4ad25d')
b2sums_aarch64=('09bf8a2bd2d3be29dc19be59db70f9526f52a001c7a48353dc50905e27f3a2ee8bcd0589cad9b07d178764163138652a76740700c0277301496e427ff8a192d4')

package() {
    cp -r "${srcdir}/opt" "${pkgdir}/"
    cp -r "${srcdir}/usr" "${pkgdir}/"

    install -dm755 "${pkgdir}/usr/bin"
    ln -sf "/opt/MetaCubeXD/metacubexd" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "${srcdir}/LICENSE"
    ln -sf "/opt/MetaCubeXD/LICENSE.electron.txt" "${pkgdir}/usr/share/licenses/${pkgname}/"
    ln -sf "/opt/MetaCubeXD/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/"
}
