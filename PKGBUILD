# Maintainer: insmtr <insmtr@insmtr.cn>
# Contributor: SummerElement <Dapugongying@foxmail.com>
pkgname=scholaread-cn-bin
pkgver=1.1.80
pkgrel=1
pkgdesc="Scholaread（靠岸学术）集论文PDF阅读、论文翻译、AI问答解析、文献多设备管理于一体"
arch=('x86_64')
url="https://scholaread.cn"
license=('custom')
depends=('gtk3' 'nss' 'libxss' 'libxtst')
optdepends=('libnotify: desktop notifications support'
            'xdg-utils: open URLs in browser'
            'libsecret: password storage support'
            'at-spi2-core: accessibility support'
            'util-linux-libs: UUID generation support'
            'libappindicator: system tray icon support')
source=("${pkgname}-${pkgver}.deb::https://cdn.scholaread.cn/assets/pc-releases/${pkgver}/cn/Scholaread-linux-amd64-${pkgver}.deb")
sha256sums=('f2fe1561f99de3e3c8de3e5089fa2aa7b57c822c6f281ad4abbc462083684123')

package() {
    # unzip DEB
    ar x "${srcdir}/${pkgname}-${pkgver}.deb"
    tar -xf data.tar.xz -C "${pkgdir}"

    # fix file permission
    chmod +x "${pkgdir}/opt/Scholaread/scholaread"
    chmod 4755 "${pkgdir}/opt/Scholaread/chrome-sandbox"

    # setup license
    install -Dm644 "${pkgdir}/opt/Scholaread/LICENSE.electron.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

post_install() {
    # update icon cache
    update-desktop-database
    gtk-update-icon-cache -qt /usr/share/icons/hicolor
}

post_upgrade() {
    post_install
}

post_remove() {
    post_install
}
