# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=dooble
pkgname="${_pkgname}-bin"
pkgver=2023.02.25
pkgrel=2
pkgdesc="Web browser based on QtWebEngine"
arch=(x86_64)
url="https://textbrowser.github.io/dooble/"
_githuburl="https://github.com/textbrowser/${_pkgname}"
license=('BSD')
depends=(unixodbc at-spi2-core gtk3 qt6-webengine qt6-svg expat xcb-util-renderutil hicolor-icon-theme libxshmfence libxrandr pango glibc xcb-util-image cairo\
    gdk-pixbuf2 qt6-declarative freetype2 libdrm xcb-util-keysyms libglvnd dbus alsa-lib libxkbcommon libxext libxdamage libxfixes qt6-positioning libxrender zlib \
    glib2 libxcomposite qt6-webchannel qt6-base libxcb libxkbfile libcups libxkbcommon-x11 gcc-libs nss krb5 fontconfig wayland nspr libxtst libx11 xcb-util-wm)
optdepends=()
providers=("${_pkgname}")
conflicts=("${_pkgname}")
source=(
    "${_pkgname}-${pkgver}.tar.gz::${_githuburl}/releases/download/${pkgver}/Dooble-${pkgver}.tar.gz"
    "${_pkgname}.desktop"
    "LICENSE::${_githuburl}/raw/master/LICENSE"
    )
sha256sums=('e15e464f2cd86b9c75e6ac3fd57910dd315350b4f5817a9839d7736ebcd37785'
            '0451898ad6b3864601d4406956558153b9518b1695545440e91bf26465c1dbe4'
            'c60bf2d6a8bfdf7c7418bba91c6767cbb4b48dccae36dd5d9ffdb48f756815dd')
package() {
    install -Dm755 -d "${pkgdir}/opt"
    bsdtar -xf "${_pkgname}-${pkgver}.tar.gz" -C "${pkgdir}/opt"
    find "${pkgdir}/opt" -type d -exec chmod 755 {} \;
    chown -R root:root "${pkgdir}"
    chmod -x "${pkgdir}/opt/dooble/Lib/libQt6WebEngineCore.so.6"
    #Use system libc.so.6
    mv "${pkgdir}/opt/${_pkgname}/Lib/libc.so.6" "${pkgdir}/opt/${_pkgname}/Lib/libc.so.6.bak"
    install -Dm644 "${pkgdir}/opt/${_pkgname}/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.png"
    install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}