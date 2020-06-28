# Maintainer: Yamato Kobayashi <yk.ymadd@gmail.com>

pkgname=webrecorder-desktop-appimg
_pkgname=Webrecorder
pkgver=2.0.2
pkgrel=2
pkgdesc="The Webrecorder Desktop App is a complete packaging of Webrecorder hosted service as an Electron application, with an integrated Chromium browser."
provides=('webrecorder')
conflicts=('webrecorder')
arch=('x86_64')
url="https://github.com/webrecorder/webrecorder-desktop"
license=(unknown)
depends=('redis')
makedepends=('git')
noextract=('Webrecorder.AppImage')
options=(!strip)
_appimg="Webrecorder.AppImage"

source=(
    "Webrecorder.AppImage::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.AppImage"
    "webrecorder.desktop"
    )

sha512sums=(
    SKIP
    SKIP
)

prepare(){
    chmod +x $_appimg
    ./$_appimg --appimage-extract
}

package() {
    #install appimage
    install -Dm755 $_appimg "${pkgdir}/usr/bin/webrecorder"

    #install desktop
    install -Dm755 webrecorder.desktop "${pkgdir}/usr/share/applications/webrecorder.desktop"
    
    #install icon
    install -Dm644 "${srcdir}/squashfs-root/webrecorder.png" "${pkgdir}/usr/share/pixmaps/webrecorder.png"
    }
