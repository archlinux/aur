# Maintainer: logan_reed <liulingzhang.work@icloud.com>

_pkgname=navicat17-premium-cs
pkgname=navicat17-premium-zh-cn
pkgver=17.3.7
pkgrel=1
pkgdesc="Navicat Premium is a multi-connection database development tool. (Chinese Simplified)"
arch=('x86_64' 'aarch64')
url='https://www.navicat.com.cn/products/navicat-premium'
license=('custom')
source_x86_64=("${_pkgname}-x86_64-${pkgver}.AppImage::https://dn.navicat.com/download/navicat17-premium-cs-x86_64.AppImage")
source_aarch64=("${_pkgname}-aarch64-${pkgver}.AppImage::https://dn.navicat.com/download/navicat17-premium-cs-aarch64.AppImage")

sha512sums_x86_64=('a95b987b3e77ad07ee4c77dce574c3a634ed7a834cf832b9033e32f3a897f21028e1c715ad65faa69ebe004144421e380e5608b65e0ab47e6e224f3529e934a8')
sha512sums_aarch64=('ddfe506403bbc21917368dacd9bb2921ee9836431728766ace2ef02dd3c90a5a906193746ce36a328cbc4575628ef5a7721b9bdc779ea97865750f377b01fa8a')

options=(!strip)

prepare() {
    cd "${srcdir}/" && rm -rf "squashfs-root"
    chmod +x "${srcdir}/${_pkgname}-x86_64-${pkgver}.AppImage"
    "${srcdir}/${_pkgname}-x86_64-${pkgver}.AppImage" --appimage-extract
}


package() {

    install -d "${pkgdir}/opt/${_pkgname}"
    cp -a ${srcdir}/squashfs-root/. ${pkgdir}/opt/${_pkgname}/
    install -Dm644 "squashfs-root/navicat.desktop" \
        "${pkgdir}/usr/share/applications/navicat.desktop"

    install -dm755 "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
    install -Dm644 "squashfs-root/usr/share/icons/hicolor/256x256/apps/navicat-icon.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/navicat-icon.png"

    install -dm755 ${pkgdir}/usr/bin
    ln -s /opt/${_pkgname}/AppRun ${pkgdir}/usr/bin/navicat
}

