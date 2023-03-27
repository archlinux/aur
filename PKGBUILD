# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=srware-iron
pkgname="${_pkgname}-bin"
pkgver=110.0.5600.0
pkgrel=2
pkgdesc="SRWare Iron Browser is a light-weight browser,based on Chromium"
arch=("x86_64")
url="https://www.srware.net"
license=('custom')
depends=(gtk2 alsa-lib qt5-base nss at-spi2-core libx11 libxcb expat libxfixes cairo libxcomposite libdrm glib2 gcc-libs \
    libxext libxdamage gdk-pixbuf2 glibc pango nspr mesa libxrandr libcups sh libxkbcommon dbus hicolor-icon-theme)
conflicts=("${_pkgname}")
provides=("SRWare")
source=(
    "${_pkgname}-${pkgver}.deb::${url}/downloads/iron64.deb"
    "LICENSE::${url}/license.txt"
    )
sha256sums=('57fe78e5c379d679629ce324665f3447ead2ea2ac55dbb2378604b7d9d19aecc'
            'a29953afc386e2a9a95906cfa0de4bf58a332260d7199a5f99d3e15db9381022')
package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}"
    install -Dm755 -d "${pkgdir}/opt"
    mv "${pkgdir}/usr/share/iron" "${pkgdir}/opt/${_pkgname}"
    find "${pkgdir}" -type d -exec chmod 755 {} \;
    find "${pkgdir}" -type f -exec chmod 644 {} \;
    chmod +x "${pkgdir}/opt/${_pkgname}/"chrome*
    sed 's/Exec=\/usr\/share\/iron\/chrome-wrapper/Exec=\/opt\/srware-iron\/chrome-wrapper/g;s/Icon=iron_product_logo/Icon=srware-iron/g' \
        -i "${pkgdir}/usr/share/applications/iron.desktop"
    sed 's/Exec=\/usr\/share\/iron\/IronConfigBackup/Exec=\/opt\/srware-iron\/IronConfigBackup/g;s/Icon=iron_product_logo/Icon=srware-iron/g' \
        -i "${pkgdir}/usr/share/applications/iron_backup.desktop"
    install -Dm644 "${pkgdir}/usr/share/pixmaps/iron_product_logo.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.png"
    rm -rf "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
