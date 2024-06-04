# Maintainer: Antti <antti@antti.codes>

pkgname=modrinth-app-bin
_pkgname=${pkgname%-bin}
pkgver=0.7.1
pkgrel=2
pkgdesc='An unique, open source launcher that allows you to play your favorite mods, and keep them up to date, all in one neat little package.'
url='https://modrinth.com/app'
arch=('x86_64')
license=('GPL3')
depends=(
    'fuse2'
)
provides=('modrinth-app')
conflicts=('modrinth-app')
source=(
    "$_pkgname-$pkgver.AppImage::https://launcher-files.modrinth.com/versions/${pkgver}/linux/modrinth-app_${pkgver}_amd64.AppImage"
    "modrinth-app"
)
options=(!strip !debug)
noextract=("modrinth-app_${pkgver}_amd64.AppImage")
sha256sums=('24f6a53b34eec89d9f8651daab871d5be0fe2616da8d163609728c2c1906c0c5'
            '1aeb1f04049731e4e03d0ce9f6e3da9ae0716ff4a858e10b761cf0600cf2860a')

package() {
    cd "$srcdir"

    chmod +x "$_pkgname-$pkgver.AppImage"
    "./$_pkgname-$pkgver.AppImage" --appimage-extract "modrinth-app.desktop"
    "./$_pkgname-$pkgver.AppImage" --appimage-extract "usr/share/icons/hicolor/128x128/apps/modrinth-app.png"
    "./$_pkgname-$pkgver.AppImage" --appimage-extract "usr/share/icons/hicolor/256x256@2/apps/modrinth-app.png"

    cp -r "squashfs-root/usr/" "${pkgdir}"

    install -Dm644 "squashfs-root/modrinth-app.desktop" "$pkgdir/usr/share/applications/modrinth-app.desktop"
    install -Dm755 "$_pkgname-$pkgver.AppImage" "$pkgdir/opt/modrinth-app/modrinth-app.AppImage"
    install -Dm755 "modrinth-app" "$pkgdir/usr/bin/modrinth-app"
}
