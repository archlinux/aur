# Maintainer: zayn7lie <zayn7lie.ber7+git@gmail.com>

pkgname="trezor-suite"
pkgver="25.11.3"
pkgrel=0
pkgdesc="The simplier, the safer. This AUR just install the AppImage and .desktop without other things."
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
    "d3436773bc58dec9cfe604b91b3b33804dcc553359ea3522538dc3ebc3f3e1a63380d68f9fc24cba1de40b4c9bc66e076879d9f440b812b69af54e603bc32adf"
    # echo '00Nnc7xY3snP5gS5GzszgE3MVTNZ6jUiU43D68Pz4aYzgNaPn8JMuh3kC0ybxm4HaHnZ9EC4Eraa9U5gO8Mq3w==' | base64 -d | od -An -tx1 | tr -d ' \n'
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
