# Maintainer: logan_reed <liulingzhang.work@icloud.com>

_pkgname=navicat17-premium-cs
pkgname=navicat17-premium-zh-cn
pkgver=17.3.5
pkgrel=1
pkgdesc="Navicat Premium is a multi-connection database development tool. (Chinese Simplified)"
arch=('x86_64' 'aarch64')
url='https://www.navicat.com.cn/products/navicat-premium'
license=('custom')
source_x86_64=("${_pkgname}-x86_64-${pkgver}.AppImage::https://dn.navicat.com/download/navicat17-premium-cs-x86_64.AppImage")
source_aarch64=("${_pkgname}-aarch64-${pkgver}.AppImage::https://dn.navicat.com/download/navicat17-premium-cs-aarch64.AppImage")

sha512sums_x86_64=('8096845709bcf85b57a69432d1874043a69a203d4ff3814731d939732f811c7de671f9715daa3952a14d7d8f1c7d635b3561f63bd3627e60645cde78a65179a7')
sha512sums_aarch64=('63c4d4e20b37b2f91dde7cbb17c962770ebd8eb739dbeb0324a5ddcf8ef483fe9fe8378b2482eafdb5dbf3ca4fc0ec6485557fe9f8d2966bfdd27c563f59a956')

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
