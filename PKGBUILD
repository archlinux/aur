# Maintainer: Yamato Kobayashi <yk.ymadd@gmail.com>
# Contributor: Felix Golatofski <contact@xdfr.de>

pkgname=webrecorder-desktop-appimage
_pkgname=Webrecorder
pkgver=2.0.2
pkgrel=1
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

source=("Webrecorder.AppImage::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.AppImage"
	"webrecorder.desktop")

sha512sums=('aaa415b64c8d4dcbb57e3778881bf887d03c48a4957fe653244b0fca37349d54d709cd9af6cd5cbe46ffb1bcf6b9ebba816135d7905cd380b0d1bde7901242eb'
            '5d6154b7f77f6878d7d02df5cb354157a220baed847dd21b9d512ec6ab133b4add3d1084359dbc1b70ac3e95afbd4d096b7ad86f0fdeec1e77ea6d2038ac1da3')

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
