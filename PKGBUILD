# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="aechoterm-bin"
pkgver=4.0.0
pkgrel=4
pkgdesc="A free, cross-platform terminal and file management tool for accessing remote servers with SSH and SFTP protocols.
    闪令是一款免费的、跨平台的,以SSH、SFTP协议访问远程服务器的终端、文件管理工具"
arch=('aarch64' 'x86_64')
url="https://ec.nantian.com.cn/"
license=('custom')
conflicts=("${pkgname%-bin}")
depends=('electron' 'hicolor-icon-theme')
makedepends=('asar')
source=("${pkgname%-bin}.sh")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::https://ec.cnd.nantiangzzx.com/${pkgname%-bin}_${pkgver}_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::https://ec.cnd.nantiangzzx.com/Aechoterm_${pkgver%}_amd64.deb")
sha256sums=('304516c5021ebb15e3424c1e8e974b144284f18ab7a8169914c8cb504ab7799c')
sha256sums_aarch64=('b6c3ad256bdde7d31bcdf0125a47a4b6438e69d899ae6188d7ac1898dcb4f2fb')
sha256sums_x86_64=('3c1681aae8b3426577fbcab4401ba2af7a9f77152e1836029d9f45748ab58904')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    asar pack "${srcdir}/opt/Aechoterm/resources/app" "${srcdir}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/${pkgname%-bin}.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/Aechoterm/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/usr/share/icons" "${pkgdir}/usr/share"
}