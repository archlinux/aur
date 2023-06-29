# Maintainer: Luis Aranguren <pizzaman@hotmail.com>

_pkgname=BlockstreamGreen
_upkgname=green
pkgname=blockstream-green-appimage
pkgver=1.2.2
pkgrel=1
pkgdesc="Blockstream Green is a non-custodial Bitcoin wallet, compatible with Blockstream Jade hardware wallet"
arch=('x86_64')
url="https://blockstream.com/green/"
license=('GPL3')
depends=('hicolor-icon-theme' 'zlib' 'fuse' 'gtk3')
makedepends=('p7zip')
noextract=("$_pkgname-$pkgver.AppImage")
install="${pkgname}.install"
options=('!strip')

source=("https://github.com/Blockstream/green_qt/releases/download/release_$pkgver/$_pkgname-$arch.AppImage")
sha256sums=('a2ad12f7323aaad4a029e81fb02d4f209de1545c6339d3f462db42e1e70a91b2')

prepare() {
    cd "${srcdir}"
    7z x "${srcdir}/$_pkgname-$arch.AppImage" usr/share/applications/$_upkgname.desktop usr/share/icons/hicolor/512x512/apps/$_upkgname.png
}

package() {
    cd "${srcdir}"
    install -Dm755 "$_pkgname-$arch.AppImage"                                        "${pkgdir}/opt/$_upkgname/$_upkgname.AppImage"
    install -Dm644 "${srcdir}/usr/share/applications/$_upkgname.desktop"             "${pkgdir}/usr/share/applications/$_upkgname.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/$_upkgname.png"   "${pkgdir}/usr/share/icons/hicolor/512x512/apps/$_upkgname.png"
    mkdir "${pkgdir}/usr/bin"
    ln -s "/opt/$_upkgname/$_upkgname.AppImage"                                      "${pkgdir}/usr/bin/$_upkgname"
}
