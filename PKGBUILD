# Maintainer: sinbud2004 <sinbud2004@gmail.com>
pkgname=bazi-cli
pkgver=2.0.0
pkgrel=1
pkgdesc="命理精研——中国传统命理桌面应用（八字 / 紫微斗数 / 黄大仙灵签 / 周易六十四卦）"
arch=('x86_64')
url="https://github.com/Paul-sinbud2004/bazi-cli"
license=('MIT')
depends=('glibc' 'zlib' 'gcc-libs' 'fontconfig' 'freetype2' 'glib2'
         'libxkbcommon' 'libxkbcommon-x11' 'libxcb' 'libx11' 'libxext'
         'libxrender' 'libgl' 'libegl' 'libdrm' 'dbus' 'hicolor-icon-theme')
provides=('destiny_cn')
conflicts=('destiny_cn')
source=("destiny_cn-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/destiny_cn-${pkgver}-x86_64.tar.gz")
sha256sums=('f4333b420c7d7359676bc6c91f5c9517135642510a6b07acba362968422bfb9f')

package() {
    cd "${srcdir}/destiny_cn-${pkgver}"

    # 主程序与兼容旧版的命令名
    install -Dm755 destiny_cn "${pkgdir}/usr/bin/destiny_cn"
    ln -s destiny_cn "${pkgdir}/usr/bin/bazi-cli"

    # 桌面入口与图标
    install -Dm644 destiny_cn.desktop \
        "${pkgdir}/usr/share/applications/destiny_cn.desktop"
    install -Dm644 destiny_cn.svg \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/destiny_cn.svg"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
