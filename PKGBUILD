# Maintainer: Klaus Alexander Seiﬆrup <klaus at seistrup dot dk>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: zhangkaizhao <zhangkaizhao at gmail dot com>
pkgname=dooble-bin
_pkgname=Dooble
pkgver=2023.11.30
pkgrel=3
pkgdesc="Web browser based on QtWebEngine"
arch=("x86_64")
url="https://textbrowser.github.io/dooble"
_ghurl="https://github.com/textbrowser/dooble"
license=('LicenseRef-Dooble')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
  'at-spi2-core'
  'cairo'
  'freetype2'
  'gdk-pixbuf2'
  'gpgme'
  'gst-plugins-base-libs'
  'gstreamer'
  'gtk3'
  'libcups'
  'libdrm'
  'libglvnd'
  'libx11'
  'libxcb'
  'libxext'
  'libxkbcommon'
  'libxkbcommon-x11'
  'libxrandr'
  'pango'
  'postgresql-libs'
  'qt6-base'
  'qt6-charts'
  'qt6-declarative'
  'qt6-multimedia'
  'qt6-positioning'
  'qt6-serialport'
  'qt6-svg'
  'qt6-tools'
  'qt6-wayland'
  'qt6-webchannel'
  'qt6-webengine'
  'unixodbc'
  'wayland'
  'xcb-util-cursor'
  'xcb-util-image'
  'xcb-util-keysyms'
  'xcb-util-renderutil'
  'xcb-util-wm'
  'libxshmfence'
  'nspr'
  'alsa-lib'
  'krb5'
  'libxtst'
  'libxcomposite'
  'libxfixes'
  'expat'
  'libxrender'
  'libxdamage'
  'fontconfig'
  'libxi'
  'libxkbfile'
  'nss'
)
optdepends=(
  'bzip2: needed in plugins/multimedia/libffmpegmediaplugin.so'
)
makedepends=(
  'findutils'
)
source=(
  "${pkgname%-bin}-${pkgver}.tar.gz::${_ghurl}/releases/download/${pkgver}/${_pkgname}-${pkgver}_amd64.deb"
  "LICENSE-${pkgver}::https://raw.githubusercontent.com/textbrowser/dooble/${pkgver}/LICENSE"
  "${pkgname%-bin}.sh"
)
sha256sums=('ccbe838464b18cb3ae16580f0173df4346914504bccc6fc14db1bf537eb9da6d'
            'c60bf2d6a8bfdf7c7418bba91c6767cbb4b48dccae36dd5d9ffdb48f756815dd'
            'fb6e83ced7565462bc103d45bfd82a2ea1fde0b6e549bd8c4c887c5ecd96c2d9')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${_pkgname}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data.tar.zst"
    cp "${srcdir}/opt/${pkgname%-bin}/Translations/${pkgname%-bin}_zh_CN_simple.qm" \
       "${srcdir}/opt/${pkgname%-bin}/Translations/${pkgname%-bin}_zh_CN.qm"
    sed "s|/usr/bin/${pkgname%-bin}|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    cp -r "${srcdir}/opt" "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
