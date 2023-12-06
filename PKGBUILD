# Maintainer: vvxxp8 <concatenate[g] the characters[x] in square[b] brackets[1] in[5] order[3] at gmail dot com>

pkgname=localsend-appimage
pkgver=1.13.0
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
sha512sums=("f535d8d2f40a8471e9ef777103160da58bfc9f9d13ce6cc98ff3d69e05e8675a8ce388de01d6e612fb17c8b9a00e913ecbed74e2f0031a014584f9894a3fa27c")

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
