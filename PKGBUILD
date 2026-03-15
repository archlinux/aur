# Maintainer: Antti <antti@antti.codes>

pkgname=lmath-bin
_pkgname=${pkgname%-bin}
pkgver=1.10.15
pkgrel=1
pkgdesc="A notebook software for writing and saving mathematical text and formulas with the Digabi rich text editor"
arch=('x86_64')
depends=('fuse2')
url="https://lehtodigital.fi/lmath/"
license=('custom:lmath-eula')
provides=($_pkgname)
conflicts=($_pkgname)
noextract=($_pkgname-$pkgver.AppImage)
source=($_pkgname-$pkgver.AppImage::https://github.com/lehtoroni/lmath-issues/releases/download/v$pkgver/LMath_Linux_r$pkgver-release.AppImage
        $_pkgname-file.xml
        $_pkgname.desktop
        $_pkgname-bin.sh)
sha256sums=('24e57e83b8b38dcb42907979abff53d8f4946733f354f8ac1e9a5b3e87d5632d'
            'fd3208d97f89ac14b5c10769014ceab10f157fd360a10ad520d714574c41472a'
            '18ba669032a20c7d1b074e5dcc70f48cfcaecd0ef170b0261fae7a15f87e5a26'
            'dd098047ce9decadca2271d8f2491a2576e3dac5533f045e3eab1ceb7344601c')
options=('!strip' '!debug')

package() {
    cd "$srcdir"
    
    chmod +x "$_pkgname-$pkgver.AppImage"
    "./$_pkgname-$pkgver.AppImage" --appimage-extract "lisenssi.txt"
    "./$_pkgname-$pkgver.AppImage" --appimage-extract "usr/share/icons/hicolor/0x0/apps/$_pkgname.png"

     install -Dm755 "$_pkgname-bin.sh" "$pkgdir/usr/bin/$_pkgname"
     install -Dm644 "$_pkgname-file.xml" "$pkgdir/usr/share/mime/packages/$_pkgname-file.xml"
     install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
     install -Dm644 "squashfs-root/lisenssi.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

     install -Dm755 "$_pkgname-$pkgver.AppImage" "$pkgdir/opt/$_pkgname/$_pkgname.AppImage"
     install -Dm644 "squashfs-root/usr/share/icons/hicolor/0x0/apps/$_pkgname.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$_pkgname.png"
}
