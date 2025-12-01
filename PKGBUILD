# Maintainer: zayn7lie <zayn7lie.ber7+git@gmail.com>

pkgname="trezor-suite"
pkgver="25.11.2"
pkgrel=0
pkgdesc="The Trezor Suite app makes it easy and secure to manage, buy, sell, and swap your crypto—all in one place."
arch=("x86_64")
options=(!strip !debug)
_pkgname="Trezor-Suite-$pkgver-linux-$arch"
url="https://github.com/trezor/trezor-suite"
license=("custom:T-RSL")
source=(
    "https://github.com/trezor/$pkgname/releases/download/v$pkgver/$_pkgname.AppImage"
    #"https://github.com/trezor/$pkgname/releases/download/v$pkgver/$_pkgname.AppImage.asc"
)
sha512sums=(
    "ffe7c60b8077d37996f8727bb8eccfad02d0b687d955d9d09ebcb767909ca72189166fb8b4601d99c147560615f357e569b787d74e6afa9711de12614d36fc26"
    #"c2ad9da055049ce63839f237d053e689283714a36edffd50469ca8e1839303ce2738371ddc91e5c18b52475884b01214cfd8ddc3e3845bf22ce4fc5344ae0234"
)

prepare() {
    cd $srcdir
    ln -f $startdir/$_pkgname.AppImage $srcdir
    chmod +x $_pkgname.AppImage 
    $srcdir/$_pkgname.AppImage --appimage-extract
    cp squashfs-root/$pkgname.desktop $srcdir
    sed -i "s|^Exec=.*|Exec=/opt/$pkgname/$_pkgname.AppImage|" $pkgname.desktop
    cp squashfs-root/usr/share/icons/hicolor/512x512/apps/$pkgname.png $srcdir
}

package() {
    cd $srcdir
    install -Dm755 -t $pkgdir/opt/$pkgname/ $_pkgname.AppImage
    install -Dm644 -t $pkgdir/usr/share/applications/ $pkgname.desktop
    install -Dm644 -t $pkgdir/usr/share/icons/hicolor/512x512/apps/ $pkgname.png
}
