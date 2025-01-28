# Maintainer: y-not-u <voganwong@hotmail.com>

pkgbase=msty
pkgname=msty-bin
_pkgname="${pkgname%-bin}"
pkgver=1.5.1
pkgrel=1
pkgdesc="The easiest way to use local and online AI models"
arch=('x86_64')
url="https://msty.app"
license=('custom')
depends=()
options=('!strip')
source=("$pkgname-$pkgver.AppImage::https://assets.msty.app/prod/latest/linux/amd64/Msty_x86_64_amd64.AppImage"
    "$_pkgname.desktop"
    "$_pkgname.png")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')
conflicts=("$_pkgname")

package() {
    cd "$srcdir"

    # Create directories
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/opt/$pkgname"
    install -dm755 "$pkgdir/usr/share/applications"
    install -dm755 "$pkgdir/usr/share/icons/hicolor/256x256/apps"

    # Install AppImage
    install -Dm755 "$pkgname-$pkgver.AppImage" "$pkgdir/opt/$pkgname/$pkgname.AppImage"

      # Install icon
    install -Dm644 "$_pkgname.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$_pkgname.png"

      # Install desktop file
    install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"

    # Symlink executable
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}
