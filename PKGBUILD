# Maintainer: Rain Clark <rain AT melonbread DOT dev>

pkgname=imgbrd-grabber-appimage
pkgver=7.6.1
pkgrel=1
pkgdesc="Very customizable imageboard/booru downloader with powerful filenaming features."
arch=('x86_64')
url="https://github.com/Bionus/imgbrd-grabber"
license=('Apache')
depends=('hicolor-icon-theme' 'zlib' 'fuse')
makedepends=('p7zip')

_pkgname="Grabber_v$pkgver-$arch.AppImage"
_upkgname=grabber

noextract=('$_pkgname')
options=('!strip')

source=(https://github.com/Bionus/imgbrd-grabber/releases/download/v${pkgver}/${_pkgname})
sha256sums=('2429803d41f97f8650ec06f8c2394c34cf5eeed562081cfc0c2e58b3d321d491')

prepare() {
    cd "${srcdir}"
    7z x "${srcdir}/$_pkgname" $_upkgname.desktop usr/share/icons/hicolor/128x128/apps/$_upkgname.png
    sed -i "s/Exec=Grabber/Exec=\/usr\/bin\/$_upkgname/" $_upkgname.desktop
}

package() {
    cd "${srcdir}"
    install -Dm755 "$_pkgname"                                                       "${pkgdir}/opt/$_upkgname/$_upkgname.AppImage"
    install -Dm644 "$_upkgname.desktop"                                             "${pkgdir}/usr/share/applications/$_upkgname.desktop"
    install -Dm644 "usr/share/icons/hicolor/128x128/apps/$_upkgname.png"            "${pkgdir}/usr/share/icons/hicolor/128x128/apps/$_upkgname.png"
    mkdir "${pkgdir}/usr/bin"
    ln -s "/opt/$_upkgname/$_upkgname.AppImage" "${pkgdir}/usr/bin/$_upkgname"
}

