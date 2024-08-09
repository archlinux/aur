# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# contributor <su975853527 at gmail dot com>
pkgname=gstarcad-bin
pkgver=24.1
_subver=sp1
pkgrel=4
pkgdesc="浩辰 CAD.Free trial for 30 days"
arch=(
    'aarch64'
    'x86_64'
)
license=('LicenseRef-custom')
url="https://www.gstarcad.com/cad_linux"
_downurl="https://official-cn.gstarcad.cn"
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
options=('!strip')
depends=(
    'qt5-base'
    'qt5-svg'
    'curl'
    'sqlite'
    'openssl-1.1'
    'libpng12'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_downurl}/linux/2024/${_subver}/deb/${pkgname%-bin}_${pkgver}_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_downurl}/linux/2024/${_subver}/deb/${pkgname%-bin}_${pkgver}_amd64.deb")
source=("${pkgname%-bin}.sh")
sha256sums=('c676f1f8e53bd460a5cfab81dfc52ee3c1b96819c8862e1996517988c065a3b9')
sha256sums_aarch64=('bee290f7578d2c7ede25551b8ebf978834812d27fb1868dd8f800ae0f85656dc')
sha256sums_x86_64=('cac879546a1ad8aabad0246d95ea25f77b628a0879392f570269f50882a8e8b5')
build(){
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|gcad|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
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