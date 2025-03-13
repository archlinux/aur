# Maintainer: Antti Ellilä <antti@antti.codes>

pkgname=kalkki-bin
_pkgname=${pkgname%-bin}
pkgver=0.2.4
pkgrel=1
pkgdesc="Modern scientific calculator powered by web technologies inspired by SpeedCrunch"
arch=("x86_64")
url="https://kalkki.raikas.dev/"
license=('AGPL-3.0-or-later')
provides=(kalkki)
conflicts=(kalkki)
depends=('fuse2')
source=(
    "$_pkgname-$pkgver.AppImage::https://github.com/raikasdev/kalkki/releases/download/v${pkgver}/kalkki_${pkgver}_amd64.AppImage"
    "kalkki"
)
sha256sums=('ba9c84b3100c7ca96cdaa2f3e0bee536036268aed35ce0873aee4e26096ee272'
            '5c2330edccc31de727f6658a8080b2f701ef6dcc84c7ecfbb2b29b2c224a2dd8')
options=(!strip !debug)
noextract=("$_pkgname-$pkgver.AppImage")

package() {
    chmod +x "$_pkgname-$pkgver.AppImage"
    "./$_pkgname-$pkgver.AppImage" --appimage-extract "usr/share/applications"
    "./$_pkgname-$pkgver.AppImage" --appimage-extract "usr/share/icons"

    install -Dm755 "$_pkgname-$pkgver.AppImage" "$pkgdir/opt/kalkki/kalkki.AppImage"
    install -Dm755 "kalkki" "$pkgdir/usr/bin/kalkki"
    install -dm755 "$pkgdir/usr/share/"
    cp -r "squashfs-root/usr/share/applications" "$pkgdir/usr/share/applications"
    cp -r "squashfs-root/usr/share/icons" "$pkgdir/usr/share/icons"
}
