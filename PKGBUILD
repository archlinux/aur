# Maintainer: Thomas Weber <weber_t+aur at mailbox dot org>

pkgname=turbowarp-desktop-bin
pkgver=1.1.3
pkgrel=2
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
sha256sums=('cf8940164ab316812150e984c0ba648aabfab899d0631a1a33178a1dd386c661'
            'defc58d3fe0c5fbfd7b5edef2137a78dc9c4acd8cf9e78ee6118bbce65c22d9a'
            'efd2cc6c3f4e2de57a823f6587ca1c3c3b318618e94e2c1e9c14844e36fa8c4b'
            '172c033a4652e69cd6e3830e56d736f7e3a11b9315bd689227788ce13dc83913')

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
