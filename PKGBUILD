# Maintainer: logan_reed <liulingzhang.work@icloud.com>

_pkgname=navicat17-premium-cs
pkgname=navicat17-premium-zh-cn
pkgver=17.3.6
pkgrel=1
pkgdesc="Navicat Premium is a multi-connection database development tool. (Chinese Simplified)"
arch=('x86_64' 'aarch64')
url='https://www.navicat.com.cn/products/navicat-premium'
license=('custom')
source_x86_64=("${_pkgname}-x86_64-${pkgver}.AppImage::https://dn.navicat.com/download/navicat17-premium-cs-x86_64.AppImage")
source_aarch64=("${_pkgname}-aarch64-${pkgver}.AppImage::https://dn.navicat.com/download/navicat17-premium-cs-aarch64.AppImage")

sha512sums_x86_64=('8adf6324be2d10928256f0d7ddde46b8f79bf218031653094596028f35d0319c154f9fba5834635d69f946bfebbd495a15df7b3ac0c588f6aeee71310606d0cd')
sha512sums_aarch64=('fb6c6cdf54f7ba4d0233830f9a0acef8e3b147ece03a00ba1078b7a733033713c7594239545fad6b649aeb2af912d99d594c19930b72cdd2ae3f52aec2e8b98a')

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

