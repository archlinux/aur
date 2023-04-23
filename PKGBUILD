# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="htbrowser-bin"
pkgver=5.0.2.10
pkgrel=2
pkgdesc="红莲花国密浏览器是政企专用浏览器，支持国产密码算法，全面适配信创环境，可以提供国产密码改造服务，既满足安全可靠又保障自主可控的浏览器使用需求。"
arch=('x86_64')
url="http://www.haitaibrowser.com"
license=('custom')
provides=()
conflicts=("${pkgname%-bin}")
depends=('nss' 'libxrandr' 'libdrm' 'libxshmfence' 'gtk2' 'libcups' 'libxcomposite' 'expat' 'gdk-pixbuf2' 'libxext' 'freetype2' \
    'cairo' 'fontconfig' 'hicolor-icon-theme' 'dbus' 'glib2' 'zlib' 'libxdamage' 'libxfixes' 'alsa-lib' 'libxcb' 'gcc-libs' \
    'mesa' 'at-spi2-core' 'libx11' 'pango' 'sh' 'nspr' 'libglvnd' 'glibc')
source=("${pkgname%-bin}-${pkgver}.deb::${url}:20000/download/${pkgname%-bin}_l_x86_${pkgver}.deb"
        "LICENSE")
sha256sums=('8256b864f9d3a79caffbbb8027d9ad666b3ff5eadfc22ae131bc407cde968837'
            'c74e69c2dd5cd4543f078bce866947b1f6fdf9eea2de843810f0a6b89ee76f3f')
   
package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}" --uname root --gname root
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    rm -rf "${pkgdir}/usr/bin" "${pkgdir}/usr/share/menu"
    chmod 644 "${pkgdir}/opt/${pkgname%-bin}/SKFAPI.dll"
    chmod 1777 "${pkgdir}/var/tmp"
    sed 's|Icon=/opt/htbrowser/htbrowser.png|Icon=htbrowser|g' -i "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}