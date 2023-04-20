# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tiantianmazi-bin
_appname=ttmz
pkgver=1.0.1
pkgrel=1
pkgdesc="天天码字是面向网文作者人群的一款方便,适用的码字工具平台."
arch=('x86_64')
url="http://www.tiantianmazi.com/"
license=('custom')
provides=()
conflicts=("${pkgname%-bin}")
depends=('nspr' 'glib2' 'at-spi2-core' 'alsa-lib' 'libxdamage' 'gcc-libs' 'mesa' 'libcups' 'expat' 'cairo' 'libxkbcommon' \
    'libdrm' 'hicolor-icon-theme' 'libxfixes' 'libxrandr' 'libxcb' 'libxext' 'libx11' 'gtk3' 'pango' 'dbus' 'nss' 'glibc' 'libxcomposite')
options=()
source=("${pkgname%-bin}-${pkgver}.deb::http://asset.yycdn.cn/app/%E5%A4%A9%E5%A4%A9%E7%A0%81%E5%AD%97.deb"
    "LICENSE.html::${url}/agreement.html")
sha256sums=('8dbb468c3fb9e03f63c543d68c2b2855b6381df153aada3a0ea4ff8d87de937b'
            '92d01a96c324eb11ef8600d1014c5ac041c7ad30649f399a5c3fd83181b6ab30')
package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}" --gname root --uname root
    mv "${pkgdir}/opt/天天码字" "${pkgdir}/opt/${pkgname%-bin}"
    sed 's|Exec="/opt/天天码字/ttmz"|Exec="/opt/tiantianmazi/ttmz"|g;s|/opt/天天码字/ttmz.png|ttmz|g' -i "${pkgdir}/usr/share/applications/${_appname}.desktop"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    find "${pkgdir}" -type f -exec chmod -R 644 * {} \;
    find "${pkgdir}" -type d -exec chmod -R 755 * {} \;
    chmod +x "${pkgdir}/opt/${pkgname%-bin}/ttmz"
}