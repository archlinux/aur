# Maintainer: Luis Aranguren <pizzaman@hotmail.com>

_pkgname=Blockstream
_upkgname=blockstream
pkgname=blockstream-app-appimage
pkgver=2.0.28
pkgrel=2
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
sha256sums=('814052231c81141521e628d312741155d36f1327d138bdc70cdbd490b29930c0')

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
