# Maintainer: vvxxp8 <concatenate[g] the characters[x] in square[b] brackets[1] in[5] order[3] at gmail dot com>

pkgname=localsend-appimage
pkgver=1.12.0
pkgrel=1
pkgdesc="An open source cross-platform alternative to AirDrop"
arch=("x86_64")
url="https://localsend.org"
license=("MIT")
_pkgname="LocalSend-${pkgver}-linux-x86-64.AppImage"
noextract=(${_pkgname})
options=("!strip")
depends=('fuse2')
source=("${_pkgname}::https://github.com/localsend/localsend/releases/download/v${pkgver}/${_pkgname}")
sha512sums=("188f8ecf4787ee705e7460e20f7f027e61abf352bee84c668d779459af805836d4aac7d9946b7738be6f4dd05b7f32f2f9a3d036821247f8a46e0adf7193a284")

_installdir=/opt/appimages

prepare() {
    chmod a+x ${_pkgname}
    ./${_pkgname} --appimage-extract >/dev/null
    sed -i "s+^Exec=.*+Exec=env DESKTOPINTEGRATION=no ${_installdir}/localsend.AppImage+" "squashfs-root/org.localsend.localsend_app.desktop"
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
