# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=srware-iron-bin
pkgver=111.5650.0
pkgrel=1
pkgdesc="SRWare Iron Browser is a light-weight browser,based on Chromium"
arch=("x86_64")
url="https://www.srware.net"
license=('custom')
depends=('gtk2' 'alsa-lib' 'qt5-base' 'nss' 'at-spi2-core' 'libx11' 'libxcb' 'expat' 'libxfixes' 'cairo' 'libxcomposite' 'libdrm' 'glib2' \
    'libxext' 'libxdamage' 'gdk-pixbuf2' 'glibc' 'pango' 'nspr' 'mesa' 'libxrandr' 'libcups' 'sh' 'libxkbcommon' 'dbus' 'gcc-libs')
conflicts=("${pkgname%-bin}")
provides=("SRWare")
source=("${pkgname%-bin}-${pkgver}.deb::${url}/downloads/iron64.deb"
    "LICENSE::${url}/license.txt")
sha256sums=('40cb77b65df2330b955737cee211d735094694326b6767bbad919393daf281d6'
            'a29953afc386e2a9a95906cfa0de4bf58a332260d7199a5f99d3e15db9381022')
package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}"
    install -Dm755 -d "${pkgdir}/opt"
    mv "${pkgdir}/usr/share/iron" "${pkgdir}/opt/${pkgname%-bin}"

    sed 's|Exec=/usr/share/iron/chrome-wrapper|Exec=/opt/srware-iron/chrome-wrapper|g;s|Icon=iron_product_logo|Icon=srware-iron|g' \
        -i "${pkgdir}/usr/share/applications/iron.desktop"
    sed 's|Exec=/usr/share/iron/IronConfigBackup|Exec=/opt/srware-iron/IronConfigBackup|g;s|Icon=iron_product_logo|Icon=srware-iron|g' \
        -i "${pkgdir}/usr/share/applications/iron_backup.desktop"
    mv "${pkgdir}/usr/share/pixmaps/iron_product_logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    find "${pkgdir}" -type d -exec chmod 755 {} \;
    find "${pkgdir}" -type f -exec chmod 644 {} \;
    chmod a+x "${pkgdir}/opt/${pkgname%-bin}/"chrome*
}
