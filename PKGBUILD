# Maintainer: myuki <mioki dot cinnamon650 at 8shield dot net>

_pkgname=metacubexd-desktop
pkgname=${_pkgname}-bin
pkgver=1.276.0
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
b2sums_x86_64=('667d5585ac9d978b11bf543ce3ad16502ea16d0846e91b85e7676e2d98657a5f86e28afa758662c3fa68bf66ebcd69ff71ebb62d1d3ab9d28d4b9be974f174cf')
b2sums_aarch64=('976825cf761d7b0d92dbb442a12d7ac6784018c1b22ca53e3e1fc28b4c219f207fc032e0201aaf316415e86ec45b05a57aac33496ca856b42d34fe59c3ba4fe0')

package() {
    cp -r "${srcdir}/opt" "${pkgdir}/"
    cp -r "${srcdir}/usr" "${pkgdir}/"

    install -dm755 "${pkgdir}/usr/bin"
    ln -sf "/opt/MetaCubeXD/metacubexd" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "${srcdir}/LICENSE"
    ln -sf "/opt/MetaCubeXD/LICENSE.electron.txt" "${pkgdir}/usr/share/licenses/${pkgname}/"
    ln -sf "/opt/MetaCubeXD/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/"
}
