# Maintainer: Thomas Weber <contact at turbowarp dot org>

pkgname=turbowarp-desktop-bin
pkgver=1.10.0
pkgrel=1
pkgdesc="Scratch mod with a compiler to run projects faster, dark mode for your eyes, a bunch of addons to improve the editor, and more."
arch=("any")
url="https://desktop.turbowarp.org/"
license=("GPL3")
depends=("electron26")
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/TurboWarp/desktop/releases/download/v$pkgver/TurboWarp-linux-armv7l-$pkgver.tar.gz"
    "$pkgname.sh"
    "$pkgname.desktop"
    "$pkgname.xml"
)
noextract=("$pkgname-$pkgver.tar.gz")
sha256sums=('3280c31d116968c96c76cca19e7537d8d0fa25f89b252e9adf81afbcff972d66'
            '1e0fec35bd09b28a95e002622577dd70a8b76978f40a30975793d78a8bdf593a'
            'd2f66e5f85b4996d264f40142745203642b1339f77b1a99e3301092f82cfbf55'
            '931f2718e03cb9ecbdd25bf65b0e22c3d8479eb473b89cd0de26e9193738d660')

prepare() {
    mkdir -p "$srcdir/$pkgname-$pkgver"
    bsdtar -xf "$pkgname-$pkgver.tar.gz" -C "$srcdir/$pkgname-$pkgver" --strip-components 1
}

package() {
    install -Dm755 "$pkgname.sh" "$pkgdir/usr/bin/turbowarp-desktop"
    install -Dm755 "$pkgname.desktop" "$pkgdir/usr/share/applications/turbowarp-desktop.desktop"
    install -Dm644 "$pkgname.xml" "$pkgdir/usr/share/mime/packages/turbowarp-desktop.xml"
    install -Dm644 "$srcdir/$pkgname-$pkgver/resources/icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/turbowarp-desktop.png"
    mkdir -p "$pkgdir/usr/share/turbowarp-desktop"
    cp -r "$srcdir/$pkgname-$pkgver/resources"/* "$pkgdir/usr/share/turbowarp-desktop"
}
