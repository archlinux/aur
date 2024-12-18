# Maintainer: ikyope at outlook dot com

pkgname=localsend-appimage
pkgver=1.16.1
pkgrel=1
pkgdesc="An open source cross-platform alternative to AirDrop"
arch=("x86_64")
url="https://localsend.org"
license=("Apache-2.0")
_pkgname="LocalSend-${pkgver}-linux-x86-64.AppImage"
noextract=(${_pkgname})
options=("!strip" "!debug")
depends=("fuse2")
conflicts=("localsend")
source=("${_pkgname}::https://github.com/localsend/localsend/releases/download/v${pkgver}/${_pkgname}")
b2sums=("85d4ddd2a993352e1636f97bd8d1bc197b9228111a602cc4bf67e9c5aea0ab912dd87e2bc13b73f61ac718c21b3f2dfe0209094f0dadbfbb93c4f2e49c25b626")

_installdir=/opt/appimages

prepare() {
    chmod a+x ${_pkgname}
    ./${_pkgname} --appimage-extract >/dev/null
    sed -i "s+^Exec=.*+Exec=${_installdir}/localsend.AppImage+" "squashfs-root/org.localsend.localsend_app.desktop"
    sed -i "s+^Icon=.*+Icon=localsend-appimage+" "squashfs-root/org.localsend.localsend_app.desktop"
    sed -i "s+^Comment=.*+Comment=An open source cross-platform alternative to AirDrop+" "squashfs-root/org.localsend.localsend_app.desktop"
}

package() {
    install -Dm755 ${_pkgname} "${pkgdir}/${_installdir}/localsend.AppImage"
    install -Dm644 "squashfs-root/usr/share/icons/hicolor/32x32/apps/localsend.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/localsend-appimage.png"
    install -Dm644 "squashfs-root/usr/share/icons/hicolor/128x128/apps/localsend.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/localsend-appimage.png"
    install -Dm644 "squashfs-root/usr/share/icons/hicolor/256x256/apps/localsend.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/localsend-appimage.png"
    install -Dm644 "squashfs-root/data/flutter_assets/assets/img/logo-512.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/localsend-appimage.png"
    install -Dm644 "squashfs-root/org.localsend.localsend_app.desktop" "${pkgdir}/usr/share/applications/org.localsend.localsend_app.desktop"
}
