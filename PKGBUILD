# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=suwell-reader-bin
_pkgname=SuwellReader
_appname=cn.suwell.reader
pkgver=3.0.22.0916
pkgrel=3
pkgdesc="OFD Reader Professional 3.0 From Suwell .LTD"
providers="Beijing Suwell .LTD"
arch=('x86_64')
url="https://www.suwell.cn/"
_downurl="https://com-store-packages.uniontech.com"
license=('unknown')
conflicts=()
depends=('libxt' 'libjpeg6-turbo' 'gstreamer0.10-base' 'gtk2' 'glu' 'libxml2' 'zlib' 'libgpg-error' 'glib2' 'fontconfig' 'dbus' \
    'hicolor-icon-theme' 'libxext' 'freetype2' 'gstreamer0.10' 'libice' 'libglvnd' 'e2fsprogs' 'bash' 'krb5' 'libp11-kit' 'glibc' \
    'libxi' 'libxrender' 'libxau' 'gcc-libs' 'libsm' 'libx11' 'libtasn1')
source=("${pkgname%-bin}-${pkgver}.deb::${_downurl}/appstore/pool/appstore/c/${_appname}.appstore/${_appname}.appstore_${pkgver}-1_amd64.deb"
    "${pkgname%-bin}.sh")
sha256sums=('69e56165f999ca8a168d64d0e22180755c67091b700fca1e339910580b127d1f'
            'c8c958bca106e61b23b21a780c3e905b99bfc90a7a9ef9f25339a71bc562bca7')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/usr/bin/suwellreader %U|${pkgname%-bin}|g;s|Icon=|#Icon=|g" -i "${srcdir}/usr/share/applications/${_appname}.desktop"
    sed "18 i\Icon=${pkgname%-bin}" -i "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/opt/apps/${_appname}/files/bin/suwell/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/fonts/cesi_font/"*.ttf -t "${pkgdir}/usr/share/fonts/cesi-font"
    install -Dm644 "${srcdir}/usr/share/mime/packages/"*.xml -t "${pkgdir}/usr/share/mime/packages"
    for _icons in 16x16 24x24 32x32 64x64 96x96 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_appname}.app-x-suwellreader.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
}