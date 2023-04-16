# Maintainer: esskayesss <imesskayesss@gmail.com>
pkgname=udeler-bin

_ver=1.12.3
_tag=

pkgver=${_ver}
pkgrel=1
pkgdesc="Unofficail binary installer for heliomarpm's fork of udeler"
arch=("x86_64")
url="https://github.com/heliomarpm/udemy-downloader-gui"
license=("MIT")
depends=("imagemagick") 
options=('!strip')

_appimage="Udeler_Setup-v${pkgver}_linux-x86_64.AppImage"

source=(
    "https://github.com/heliomarpm/udemy-downloader-gui/releases/download/v${pkgver}/${_appimage}"
    "udeler.desktop"
    "udeler.png"
)
sha512sums=(
    "961a95a2be33e9c77a59826f59f2ddccb95a7df9d8203c521a984ebcc13d2740794db8be7370b0962528a4b27eed318636b9766523ed6b8eefb453642b0a1f70"
    "9a0a9155c244ed077a2d115fd4ef55b013051265a4d1c774b6f65ac6f961d3ac16575730dbd9da7407944406ab8277fc01174688deed110dc7ebeb8ea36e3b32"
    "9adfeaec0edb10c0dd08140ef037a7919d3dce714b2a6802919936c7fcf3837cfa15e8a8068dd3302f59c8af584d91402303962aa3c1a7a08902102d8da12e6c"
)

prepare(){
    install -dm755 "${srcdir}/${pkgname}"
    install -Dm644 ${_appimage} "${srcdir}/${pkgname}/udeler.appimage"
}

package(){
    
    install -dm755 "${pkgdir}/"{opt,usr/share/applications}
    cp -rL "${srcdir}/${pkgname}" "${pkgdir}/opt/${pkgname}"

    # installing application entry
    install -Dm644 "${srcdir}/udeler.desktop" "${pkgdir}/usr/share/applications/udeler.desktop"

    # installing icons
    for _size in "192x192" "128x128" "96x96" "64x64" "48x48" "32x32" "24x24" "22x22" "20x20" "16x16" "8x8"
    do
        install -dm755 "${pkgdir}/usr/share/icons/hicolor/${_size}/apps"
        convert "${srcdir}/udeler.png" -resize "${_size}" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/udeler.png"
    done
}
