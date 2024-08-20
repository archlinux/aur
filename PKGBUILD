# Maintainer: vvxxp8 <concatenate[g] the characters[x] in square[b] brackets[1] in[5] order[3] at gmail dot com>

pkgname=localsend-appimage
pkgver=1.15.4
pkgrel=1
pkgdesc="An open source cross-platform alternative to AirDrop"
arch=("x86_64")
url="https://localsend.org"
license=("MIT")
_pkgname="LocalSend-${pkgver}-linux-x86-64.AppImage"
noextract=(${_pkgname})
options=("!strip" "!debug")
depends=("fuse2")
conflicts=("localsend")
source=("${_pkgname}::https://github.com/localsend/localsend/releases/download/v${pkgver}/${_pkgname}"
    "LICENSE::https://raw.githubusercontent.com/localsend/localsend/main/LICENSE")
sha512sums=("abbf9a827b9754b2ca1bde1cb8f1c44f8f8c1da6050df868fe49f26cbce1919f2fa5ef6fa7135cab924efc87dfb71aec8097e47b3f1e8c74fc4334cd241e0511"
    "f41d30979e9ec16e6893c26da4862e8649be7682f74649d964223dfb52531dbebf3de2386759f64d9e5f780c6872ba0fda9bd5bca43c9f5a6f0cb69acb1b2aa0")

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
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/localsend/LICENSE"
    install -Dm644 "squashfs-root/usr/share/icons/hicolor/32x32/apps/localsend.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/localsend-appimage.png"
    install -Dm644 "squashfs-root/usr/share/icons/hicolor/128x128/apps/localsend.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/localsend-appimage.png"
    install -Dm644 "squashfs-root/usr/share/icons/hicolor/256x256/apps/localsend.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/localsend-appimage.png"
    install -Dm644 "squashfs-root/data/flutter_assets/assets/img/logo-512.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/localsend-appimage.png"
    install -Dm644 "squashfs-root/org.localsend.localsend_app.desktop" "${pkgdir}/usr/share/applications/org.localsend.localsend_app.desktop"
}
