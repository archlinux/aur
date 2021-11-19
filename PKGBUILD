# Maintainer: Rain Clark <rain AT melonbread DOT dev>

pkgname=xcloud-desktop-appimage
pkgver=1.0.9
pkgrel=1
pkgdesc="An unoffical desktop app for the XCloud web beta"
arch=('x86_64')
url="https://github.com/AAGaming00/xcloud-desktop"
license=('MIT')
depends=('hicolor-icon-theme' 'zlib' 'fuse')
makedepends=('p7zip')

_pkgname="XCloud-$pkgver.AppImage"
_upkgname=xcloud

noextract=('$_pkgname')
options=('!strip')

source=(https://github.com/AAGaming00/xcloud-desktop/releases/download/v${pkgver}/${_pkgname})
sha256sums=('bcc0d44f6923e157fa0ae0dffaafe6356733053bd0ae3e50194ae1aca7088c45')

prepare() {
    cd "${srcdir}"
    7z x "${srcdir}/$_pkgname" $_upkgname.desktop usr/share/icons/hicolor/256x256/apps/$_upkgname.png
    sed -i "s/Exec=Grabber/Exec=\/usr\/bin\/$_upkgname/" $_upkgname.desktop
}

package() {
    cd "${srcdir}"
    install -Dm755 "$_pkgname"                                                       "${pkgdir}/opt/$_upkgname/$_upkgname.AppImage"
    install -Dm644 "$_upkgname.desktop"                                             "${pkgdir}/usr/share/applications/$_upkgname.desktop"
    install -Dm644 "usr/share/icons/hicolor/256x256/apps/$_upkgname.png"            "${pkgdir}/usr/share/icons/hicolor/256x256/apps/$_upkgname.png"
    mkdir "${pkgdir}/usr/bin"
    ln -s "/opt/$_upkgname/$_upkgname.AppImage" "${pkgdir}/usr/bin/$_upkgname"
}

