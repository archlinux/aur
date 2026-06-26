# Maintainer: Yuri Zhelezko <yzhelezko@github.com>
pkgname=thermic-bin
pkgver=0.6.2
pkgrel=1
pkgdesc="Modern cross-platform terminal emulator with SSH management and WSL support"
arch=('x86_64')
url="https://github.com/yzhelezko/thermic"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3')
optdepends=('openssh: SSH connection support')
provides=('thermic')
conflicts=('thermic' 'thermic-git')
source=(
    "${pkgname}-${pkgver}::https://github.com/yzhelezko/thermic/releases/download/v${pkgver}/thermic-linux-amd64"
    "thermic.desktop::https://raw.githubusercontent.com/yzhelezko/thermic/v${pkgver}/build/linux/appimage/Thermic.desktop"
    "thermic.png::https://raw.githubusercontent.com/yzhelezko/thermic/v${pkgver}/build/appicon.png"
)
sha256sums=('d80a8b0b3fcd1d0da971f0242905fcef70906239359cd5399ba90170cd4110a8' '17e6c5009420681bf91ec4529f20575cd94fadb729fc0865ff4633aa2e3a0bc0' 'ee162e8f56a4ea2b537ddf36c13ddb534ccf7f1c9e392771870cf255d509e1c7')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/thermic"
    install -Dm644 "${srcdir}/thermic.desktop" "${pkgdir}/usr/share/applications/thermic.desktop"
    sed -i 's|Exec=Thermic|Exec=thermic|g' "${pkgdir}/usr/share/applications/thermic.desktop"
    sed -i 's|Icon=appicon|Icon=thermic|g' "${pkgdir}/usr/share/applications/thermic.desktop"
    install -Dm644 "${srcdir}/thermic.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/thermic.png"
}
