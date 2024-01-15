# Maintainer: Luis Aranguren <pizzaman@hotmail.com>

_pkgname=KeepKey-Desktop
_upkgname=keepkey-desktop
pkgname=keepkey-desktop-appimage
pkgver=2.1.39
pkgrel=1
pkgdesc="An all-in-one suite for using your KeepKey hardware wallet."
arch=('x86_64' 'arm64')
url="https://www.keepkey.com/"
license=('GPL3')
depends=('hicolor-icon-theme' 'zlib' 'fuse' 'keepkey-udev' 'gtk3' 'nss')
makedepends=('p7zip')
noextract=("$_pkgname-$pkgver.AppImage")
options=('!strip')

source=("https://github.com/keepkey/$_upkgname/releases/download/v$pkgver/$_pkgname-$pkgver.AppImage")
sha256sums=('b25832f6cd85dc8d2bbe57e5ff255c55c8daaa9a77979194982842ab296f47e8')

prepare() {
    cd "${srcdir}"
    7z x "${srcdir}/$_pkgname-$pkgver.AppImage" $_upkgname.desktop usr/share/icons/hicolor/0x0/apps/$_upkgname.png LICENSE.electron.txt LICENSES.chromium.html
    sed -i "s/Exec=AppRun/Exec=\/usr\/bin\/$_upkgname/" $_upkgname.desktop
}

package() {
    cd "${srcdir}"
    install -Dm755 "$_pkgname-${pkgver}.AppImage"                               "${pkgdir}/opt/$_upkgname/$_upkgname.AppImage"
    install -Dm644 "$_upkgname.desktop"                                         "${pkgdir}/usr/share/applications/$_upkgname.desktop"
    install -Dm644 "usr/share/icons/hicolor/0x0/apps/$_upkgname.png"            "${pkgdir}/usr/share/icons/hicolor/512x512/apps/$_upkgname.png"
    mkdir "${pkgdir}/usr/bin"
    ln -s "/opt/$_upkgname/$_upkgname.AppImage" "${pkgdir}/usr/bin/$_upkgname"
    install -Dm644 LICENSE.electron.txt                                         "$pkgdir/usr/share/licenses/$pkgname/LICENSE.electron.txt"
    install -Dm644 LICENSES.chromium.html                                       "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"
}
