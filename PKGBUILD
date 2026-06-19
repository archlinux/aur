# Maintainer: Luis Aranguren <pizzaman@hotmail.com>

_pkgname=Blockstream
_upkgname=blockstream
pkgname=blockstream-app-appimage
pkgver=3.4.1
pkgrel=1
pkgdesc="Blockstream App is a non-custodial Bitcoin wallet, compatible with Blockstream Jade hardware wallet"
arch=('x86_64')
url="https://blockstream.com/app/"
license=('GPL3')
depends=('hicolor-icon-theme' 'zlib' 'fuse' 'gtk3')
makedepends=('p7zip')
noextract=("$_pkgname-$pkgver.AppImage")
install="${pkgname}.install"
options=('!strip' '!debug')

source=($_pkgname-$arch-$pkgver.AppImage::"https://github.com/Blockstream/green_qt/releases/download/release_$pkgver/$_pkgname-$arch.AppImage")
sha256sums=('f27ddf2f1c25f87479204200bfb64f1097d4703e1587b5a1ad5f0eea089d6a99')

prepare() {
    cd "${srcdir}"
    7z x "${srcdir}/$_pkgname-$arch-$pkgver.AppImage" usr/share/applications/$_upkgname.desktop usr/share/icons/hicolor/512x512/apps/linux_production.png
}

package() {
    cd "${srcdir}"
    install -Dm755 "$_pkgname-$arch-$pkgver.AppImage"                                "${pkgdir}/opt/$_upkgname/$_upkgname.AppImage"
    install -Dm644 "${srcdir}/usr/share/applications/$_upkgname.desktop"             "${pkgdir}/usr/share/applications/$_upkgname.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/linux_production.png"   "${pkgdir}/usr/share/icons/hicolor/512x512/apps/linux_production.png"
    mkdir "${pkgdir}/usr/bin"
    ln -s "/opt/$_upkgname/$_upkgname.AppImage"                                      "${pkgdir}/usr/bin/$_upkgname"
}
