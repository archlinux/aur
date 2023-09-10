# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=aechoterm-bin
_pkgname=Aechoterm
pkgver=4.0.1
pkgrel=1
pkgdesc="A free, cross-platform terminal and file management tool for accessing remote servers with SSH and SFTP protocols.闪令是一款免费的、跨平台的,以SSH、SFTP协议访问远程服务器的终端、文件管理工具"
arch=('aarch64' 'x86_64')
url="https://ec.nantian.com.cn/"
_githuburl="https://github.com/Aechoterm/Aechoterm"
license=('custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron13' 'hicolor-icon-theme')
makedepends=('asar')
source=("${pkgname%-bin}.sh")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::https://ec.cnd.nantiangzzx.com/${_pkgname}_${pkgver}_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::https://ec.cnd.nantiangzzx.com/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('e8f1e294d1152576e54ca0231728baa2987bf371a34be268d0fd48e823ee12c2')
sha256sums_aarch64=('5ad55272b26a667cfcca3cc8c31b0afdabae8c718694b645cb19c83dc7387838')
sha256sums_x86_64=('c3cd799babbfca9a6c367891ed8612279bb59dd78ff93a374c304e9f69d78d43')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    asar pack "${srcdir}/opt/${_pkgname}/resources/app" "${srcdir}/${pkgname%-bin}.asar"
    sed "s|/opt/${_pkgname}/${pkgname%-bin} --no-sandbox %U|${pkgname%-bin}|g;s|Development|Utility|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}