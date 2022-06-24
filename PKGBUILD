# Maintainer: Thomas Weber <weber_t+aur at mailbox dot org>

pkgname=turbowarp-desktop-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="Scratch mod with a compiler to run projects faster, dark mode for your eyes, a bunch of addons to improve the editor, and more."
arch=("any")
url="https://desktop.turbowarp.org/"
license=("GPL3")
depends=("electron17")
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/TurboWarp/desktop/releases/download/v$pkgver/TurboWarp-linux-armv7l-$pkgver.tar.gz"
    "$pkgname.sh"
    "$pkgname.desktop"
    "$pkgname.xml"
)
noextract=("$pkgname-$pkgver.tar.gz")
sha256sums=('181ff6823ee0a0b65cfab7140ebad6e53cb504e40a000038565ee5848b1fb4a4'
            'defc58d3fe0c5fbfd7b5edef2137a78dc9c4acd8cf9e78ee6118bbce65c22d9a'
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
    install -Dm644 "$srcdir/$pkgname-$pkgver/resources/static/icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/turbowarp-desktop.png"
    mkdir -p "$pkgdir/usr/share/turbowarp-desktop"
    cp -r "$srcdir/$pkgname-$pkgver/resources"/* "$pkgdir/usr/share/turbowarp-desktop"
}
