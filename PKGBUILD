# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ifind-bin
pkgver=1.10.12.380.001
pkgrel=1
pkgdesc="同花顺iFinD PC版提供资讯、行情、深度资料、数据浏览器、企业库等功能,满足用户多方面的使用需求。"
arch=('x86_64')
url="https://www.51ifind.com/"
license=('custom::freeware')
provides=()
conflicts=("${pkgname%-bin}")
depends=('nss' 'alsa-lib' 'at-spi2-core' 'libxfixes' 'dbus' 'libxext' 'mesa' 'glib2' 'libxcb' 'expat' 'util-linux-libs' \
    'glibc' 'nspr' 'libdrm' 'libx11' 'gcc-libs' 'libxkbcommon' 'libxcomposite' 'libxrandr' 'libcups' 'libxdamage' 'zlib' \
    'fontconfig' 'krb5')
options=()
source=("${pkgname%-bin}-${pkgver}.deb::https://resource.thsi.cn/download/iFinD/com.51${pkgname%-bin}_uos_${pkgver}_amd64_signed.deb")
sha256sums=('197ed21fffc7e1a117c28d582b37209d09990c0e7801b160e94733bbedc08be6')
package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}"
    install -Dm644 "${pkgdir}/opt/apps/com.51ifind/files/cef/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${pkgdir}/opt/apps/com.51ifind/entries/applications/com.51ifind.desktop" -t "${pkgdir}/usr/share/applications"
    rm -rf "${pkgdir}/opt/apps/com.51ifind/info"
    find "${pkgdir}/opt/apps" -type d -exec chmod 755 {} \;
    find "${pkgdir}/opt/apps" -type f -exec chmod 644 {} \;
    chmod a+x "${pkgdir}/opt/apps/com.51ifind/files/iFinD.Mvvm"
}