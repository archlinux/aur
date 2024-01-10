# Maintainer: sukanka <su975853527 at gmail dot com>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=gstarcad-bin
pkgver=24.1
_subver=sp1
pkgrel=1
pkgdesc="浩辰 CAD.Free trial for 30 days"
arch=(
    'aarch64'
    'x86_64'
)
license=('custom')
url="https://www.gstarcad.com/cad_linux"
_downurl="https://official-cn.gstarcad.cn"
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
    'openssl-1.1'
    'libpng12'
    'curl'
    'sqlite'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_downurl}/linux/2024/${_subver}/deb/${pkgname%-bin}_${pkgver}_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_downurl}/linux/2024/${_subver}/deb/${pkgname%-bin}_${pkgver}_amd64.deb")
source=("${pkgname%-bin}.sh")
sha256sums=('95c9dc84df4bf3dc61400bf34e8fc2b36bf1b5e8d92496f3f15adc7576390c2f')
sha256sums_aarch64=('bee290f7578d2c7ede25551b8ebf978834812d27fb1868dd8f800ae0f85656dc')
sha256sums_x86_64=('cac879546a1ad8aabad0246d95ea25f77b628a0879392f570269f50882a8e8b5')
build(){
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|gcad|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed -e "s|bash /opt/apps/${pkgname%-bin}/v2024/files/gclauncher.sh %F|${pkgname%-bin} %F|g" \
        -e "s|/opt/apps/${pkgname%-bin}/v2024/files/gcad.svg|${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package(){
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" -t "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/opt/apps/${pkgname%-bin}/v2024/files/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg" -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    install -Dm644 "${srcdir}/opt/apps/${pkgname%-bin}/v2024/files/about/"*.html -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/opt/apps/${pkgname%-bin}/v2024/files/about/licenses/"*.* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}