# Maintainer: logan_reed <liulingzhang.work@icloud.com>

pkgname=trae
pkgver=2.3.25938
pkgrel=1
pkgdesc="Trae - AI-powered IDE by ByteDance"
arch=('x86_64' 'aarch64')
url="https://www.trae.cn/"
license=('custom')
provides=('trae')
conflicts=('trae-sg' 'trae-us')
depends=('nss' 'alsa-lib' 'gtk3' 'at-spi2-core' 'libsecret' 'libxkbfile')
optdepends=('libappindicator-gtk3: System tray support')
options=('!strip' '!debug')
install=${pkgname}.install
source=("trae.sh" "trae.desktop")
source_x86_64=('https://lf-cdn.trae.com.cn/obj/trae-com-cn/pkg/app/releases/stable/2.3.25938/linux/Trae-linux-x64.tar.gz')
source_aarch64=('https://lf-cdn.trae.com.cn/obj/trae-com-cn/pkg/app/releases/stable/2.3.25938/linux/Trae-linux-arm64.tar.gz')
sha512sums=('2659baca6aa6b572d7665670304d5abd7f19a92abdf4c3a231f43158f946b9c84d5fd3b41902dd16192e817b853f72bb688c6f863dff7cc0684ce4719a111b73'
            '8b5e04cd53bf71757eb5042414f3a4c49248d731ef6e7cc981d063c29b5325163e4c8500b8bacd6db2194a2fb050dfbd7b7593c64450f95792d7604d1a54f0a7')
sha512sums_x86_64=('6443c8ad9fac60c1c43581fed7431a63c45bbb49325feaa8c0405cf29117d82bd2dae460e09d739884556917577209973ba3bcb32f37e36ec8f27aeb783c31e0')
sha512sums_aarch64=('86543ed2425beb6dc29fe6f99d1a6efe7028a6f86c88a3ffd8ccbb7baff5240543a5125fa40fe2a3512cc3b07145176a895c36a0977faff005c1df390a4c8d42')

package() {
    install -d "${pkgdir}/opt/trae"
    cp -r "${srcdir}/Trae-linux-x64/"* "${pkgdir}/opt/trae/" 2>/dev/null || \
    cp -r "${srcdir}/Trae-linux-arm64/"* "${pkgdir}/opt/trae/" 2>/dev/null || true

    # SUID sandbox
    chmod 4755 "${pkgdir}/opt/trae/chrome-sandbox"

    # Launcher
    install -Dm755 "${srcdir}/trae.sh" "${pkgdir}/usr/bin/trae"

    # Desktop entry
    install -Dm644 "${srcdir}/trae.desktop" "${pkgdir}/usr/share/applications/trae.desktop"

    # Icon
    install -Dm644 "${pkgdir}/opt/trae/resources/app/resources/linux/code.png" "${pkgdir}/usr/share/pixmaps/trae.png"

    # License
    install -Dm644 "${pkgdir}/opt/trae/resources/app/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${pkgdir}/opt/trae/resources/app/ThirdPartyNotices.txt" "${pkgdir}/usr/share/licenses/${pkgname}/ThirdPartyNotices"
    install -Dm644 "${pkgdir}/opt/trae/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}
