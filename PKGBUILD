# Maintainer: sukanka <su975853527 at gmail dot com>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=gstarcad-bin
_appname="com.${pkgname%-bin}.cad"
pkgver=24.0
_subver=v10sp1
pkgrel=2
pkgdesc="浩辰 CAD.Free trial for 30 days"
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
license=('custom')
url="https://www.gstarcad.com/cad_linux/"
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
options=('!strip')
depends=(
    'libxxf86vm'
    'libsm'
    'hicolor-icon-theme'
    'libxkbcommon'
    'xcb-util-image'
    'xdg-utils'
    'xcb-util-keysyms'
    'fontconfig'
    'libcups'
    'xcb-util-wm'
    'libice'
    'xcb-util-renderutil'
    'qt5-base'
    'freetype2'
    'libxfixes'
    'libxext'
    'libxcb'
    'expat'
    'mesa'
    'libxdamage'
    'libx11'
    'systemd-libs'
    'libxshmfence'
    'qt5-svg'
    'libxkbcommon-x11'
    'libglvnd'
    'libdrm'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::https://hccad.gstarcad.cn/linux2024/v4.0/1113/${_subver}/${pkgname%-bin}_${pkgver}_arm64.deb")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.deb::https://hccad.gstarcad.cn/linux2024/v4.0/1113/${_subver}/${pkgname%-bin}_${pkgver}_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::https://hccad.gstarcad.cn/linux2024/v4.0/1113/${_subver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums_aarch64=('5661e50a07e554a98322aaa8ea8e2bf4597962667d494d974c809adf2fdaca4e')
sha256sums_armv7h=('5661e50a07e554a98322aaa8ea8e2bf4597962667d494d974c809adf2fdaca4e')
sha256sums_x86_64=('cd6a569843d911f4b379367745b853f1f08e898deee7be0c9f99706704c5ad63')
build(){
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed -e "s|bash /opt/apps/${pkgname%-bin}/v2024/files/gclauncher.sh %F|bash ${pkgname%-bin} %F|g" \
        -e "s|/opt/apps/${pkgname%-bin}/v2024/files/gcad.svg|${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    sed -e "s|/usr/bin/mate-terminal -x /opt/apps/${pkgname%-bin}/v2024/files/linux/gcad_uninstall.sh|bash -x ${pkgname%-bin}-uninstall|g" \
        -e "s|/opt/apps/${pkgname%-bin}/v2024/files/gcad.svg|${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}-uninstall.desktop"
}
package(){
    cp -r "${srcdir}/opt" "${pkgdir}/opt"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "/opt/apps/${pkgname%-bin}/v2024/files/gclauncher.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    ln -sf "/opt/apps/${pkgname%-bin}/v2024/files/linux/gcad_uninstall.sh" "${pkgdir}/usr/bin/${pkgname%-bin}-uninstall"
    install -Dm644 "${srcdir}/usr/share/applications/"*.desktop -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg" -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    install -Dm644 "${srcdir}/opt/apps/${pkgname%-bin}/v2024/files/about/"*.html -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/opt/apps/${pkgname%-bin}/v2024/files/about/licenses/"*.* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}