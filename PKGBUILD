# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=kdesktop-bin
_appname=cn.kdocs.kdesktop
pkgver=3.7.7
pkgrel=1
pkgdesc="金山文档"
arch=('x86_64')
url="https://www.kdocs.cn"
_downurl="https://mirrors.sdu.edu.cn/spark-store-repository/store"
license=('custom')
provides=("Kingsoft")
conflicts=("${pkgname%-bin}")
depends=('libxshmfence' 'dbus' 'pango' 'libxcomposite' 'libxkbcommon' 'libx11' 'libxdamage' 'libxrandr' 'gtk3' \
    'libdrm' 'libxfixes' 'mesa' 'at-spi2-core' 'glib2' 'glibc' 'gcc-libs' 'libxext' 'alsa-lib' 'nspr' 'libcups' \
    'hicolor-icon-theme' 'nss' 'expat' 'libxcb' 'cairo' 'gdk-pixbuf2')
options=()
source=("${pkgname%-bin}-${pkgver}.deb::${_downurl}/office/${_appname}/${_appname}_${pkgver}_amd64.deb"
    "LICENSE.html::${url}/privacy/account")
sha256sums=('57e6e623bbb761d5b2e3a8dd5c179189e585b40e14cc9f9f17213797093e88ef'
            'cd763cce08e142a7ac004c5bb1df082c85cfab18d93c68c457e074f6f7ce360f')
package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}"
    sed 's|/opt/apps/cn.kdocs.kdesktop/entries/icons/hicolor/256x256/apps/kdesktop.png|kdesktop|g' \
        -i "${pkgdir}/opt/apps/${_appname}/entries/applications/${_appname}.desktop"
    install -Dm644 "${pkgdir}/opt/apps/${_appname}/entries/applications/${_appname}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 24x24 32x32 48x48 64x64 128x128 256x256;do
        install -Dm644 "${pkgdir}/opt/apps/${_appname}/entries/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/"
    done
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    rm -rf "${pkgdir}/opt/apps/${_appname}/info"
}