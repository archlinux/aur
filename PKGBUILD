# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ifind-bin
_appname=com.51ifind
pkgver=1.10.12.380.001
pkgrel=2
pkgdesc="同花顺iFinD PC版提供资讯、行情、深度资料、数据浏览器、企业库等功能,满足用户多方面的使用需求。"
arch=('aarch64' 'x86_64')
url="https://www.51ifind.com/"
license=('custom::freeware')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('nss' 'alsa-lib' 'at-spi2-core' 'libxfixes' 'dbus' 'libxext' 'mesa' 'glib2' 'libxcb' 'expat' 'util-linux-libs' \
    'glibc' 'nspr' 'libdrm' 'libx11' 'gcc-libs' 'libxkbcommon' 'libxcomposite' 'libxrandr' 'libcups' 'libxdamage' 'zlib' \
    'fontconfig' 'krb5')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::https://resource.thsi.cn/download/iFinD/${_appname}_uos_${pkgver}_arm64_signed.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::https://resource.thsi.cn/download/iFinD/${_appname}_uos_${pkgver}_amd64_signed.deb")
sha256sums=('197ed21fffc7e1a117c28d582b37209d09990c0e7801b160e94733bbedc08be6')
package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}"
    install -Dm644 "${pkgdir}/opt/apps/${_appname}/files/cef/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${pkgdir}/opt/apps/${_appname}/entries/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    rm -rf "${pkgdir}/opt/apps/${_appname}/info"
    find "${pkgdir}/opt/apps" -type d -exec chmod 755 {} \;
    find "${pkgdir}/opt/apps" -type f -exec chmod 644 {} \;
    chmod a+x "${pkgdir}/opt/apps/${_appname}/files/iFinD.Mvvm"
}