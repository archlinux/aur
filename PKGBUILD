# Maintainer: myuki <mioki dot cinnamon650 at 8shield dot net>

_pkgname=metacubexd-desktop
pkgname=${_pkgname}-bin
pkgver=1.272.0
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
b2sums_x86_64=('cbad847adb9cec255483bf684cd6c5d9b3af8d166f690c8c66ca798f3d7f6b68bb0096abb1291f479ad2dfeb561061498b26287b63c2531d3282566c0f1e8a08')
b2sums_aarch64=('3bf92e5d23f27bcbd3fd56255f4b625f1bcc1570ed79721481b4cf15b4057330c2a7efeb9a7fed7894d179ffdfdca4c9578577c83a54f022ed48f77b60e713b9')

package() {
    cp -r "${srcdir}/opt" "${pkgdir}/"
    cp -r "${srcdir}/usr" "${pkgdir}/"

    install -dm755 "${pkgdir}/usr/bin"
    ln -sf "/opt/MetaCubeXD/metacubexd" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "${srcdir}/LICENSE"
    ln -sf "/opt/MetaCubeXD/LICENSE.electron.txt" "${pkgdir}/usr/share/licenses/${pkgname}/"
    ln -sf "/opt/MetaCubeXD/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/"
}
