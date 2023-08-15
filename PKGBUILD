# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=htbrowser-bin
pkgver=5.0.2.4
pkgrel=1
pkgdesc="红莲花国密浏览器是政企专用浏览器，支持国产密码算法，全面适配信创环境，可以提供国产密码改造服务，既满足安全可靠又保障自主可控的浏览器使用需求。"
arch=('x86_64')
url="http://www.haitaibrowser.com"
_downurl="https://mirrors.sdu.edu.cn/spark-store-repository"
license=('custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('nss' 'libxrandr' 'libdrm' 'libxshmfence' 'gtk2' 'libcups' 'libxcomposite' 'expat' 'gdk-pixbuf2' 'libxext' \
    'cairo' 'hicolor-icon-theme' 'dbus' 'glib2' 'zlib' 'libxdamage' 'libxfixes' 'alsa-lib' 'libxcb' 'gcc-libs' \
    'mesa' 'at-spi2-core' 'libx11' 'pango' 'sh' 'nspr' 'glibc')
source=("${pkgname%-bin}-${pkgver}.deb::${_downurl}/store/network/${pkgname%-bin}/${pkgname%-bin}_${pkgver}_amd64.deb"
        "LICENSE")
sha256sums=('644b6aa27f3a30d2e75eed25f5c30d4aecf55b6ef882906cf9fdbedd7cc31768'
            'c74e69c2dd5cd4543f078bce866947b1f6fdf9eea2de843810f0a6b89ee76f3f')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}" --uname root --gname root
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    rm -rf "${pkgdir}/usr/bin" "${pkgdir}/usr/share/menu"
    sed "s|/opt/${pkgname%-bin}/${pkgname%-bin}.png|${pkgname%-bin}|g" -i "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    chmod 644 "${pkgdir}/opt/${pkgname%-bin}/SKFAPI.dll"
    chmod 0755 "${pkgdir}/opt/${pkgname%-bin}/chrome-sandbox"
}