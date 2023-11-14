# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=htbrowser-bin
pkgver=5.0.2.20
pkgrel=1
pkgdesc="红莲花国密浏览器是政企专用浏览器，支持国产密码算法，全面适配信创环境，可以提供国产密码改造服务，既满足安全可靠又保障自主可控的浏览器使用需求。"
arch=(
    'aarch64'
    'x86_64'
)
url="http://www.haitaibrowser.com"
_downurl="https://haitaibrowser.com:20003/download"
license=('custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'nss'
    'libxrandr'
    'libdrm'
    'libxshmfence'
    'gtk2'
    'libcups'
    'libxcomposite'
    'expat'
    'gdk-pixbuf2'
    'libxext'
    'cairo'
    'hicolor-icon-theme'
    'libxdamage'
    'libxfixes'
    'alsa-lib'
    'libxcb'
    'mesa'
    'at-spi2-core'
    'libx11'
    'pango'
    'nspr'
    'freetype2'
    'libglvnd'
    'fontconfig'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_downurl}/${pkgname%-bin}_l_arm_uos_${pkgver}.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_downurl}/${pkgname%-bin}_l_x86_uos_${pkgver}.deb")
source=(
    "LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('c74e69c2dd5cd4543f078bce866947b1f6fdf9eea2de843810f0a6b89ee76f3f'
            '2c605eabd60bc4e4e2aa0cb02c9b7363b12c006bcda5cc328d779976970369e8')
sha256sums_aarch64=('165560170875d1fab323f46695439ebf785c90c687e5b5c3fcf9d503d89f697e')
sha256sums_x86_64=('808616e4736d853dc2964fdbbd4b2be888db14c23108cc2332c69f4f2b57c284')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/apps/${pkgname%-bin}/${pkgname%-bin}.sh|${pkgname%-bin}|g;s|/opt/apps/${pkgname%-bin}/${pkgname%-bin}.png|${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" -t "${srcdir}/opt/apps/${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt"
    cp -r "${srcdir}/opt/apps/${pkgname%-bin}" "${pkgdir}/opt"
    install -Dm644 "${srcdir}/usr/share/appdata/${pkgname%-bin}.appdata.xml" -t "${pkgdir}/usr/share/appdata"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 24x24 48x48 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/man/man1/${pkgname%-bin}.1.gz" -t "${pkgdir}/usr/share/man/man1"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}