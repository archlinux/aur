# Maintainer: Thomas Weber <weber_t+aur at mailbox dot org>

pkgname=turbowarp-desktop-bin
pkgver=0.14.1
pkgrel=1
pkgdesc="Scratch mod with a compiler to run projects faster, dark mode for your eyes, a bunch of addons to improve the editor, and more."
arch=("any")
url="https://desktop.turbowarp.org/"
license=("GPL3")
depends=("electron")
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/TurboWarp/desktop/releases/download/v$pkgver/TurboWarp-linux-armv7l-$pkgver.tar.gz"
    "$pkgname.sh"
    "$pkgname.desktop"
    "$pkgname.xml"
)
noextract=("$pkgname-$pkgver.tar.gz")
sha256sums=('df4b2d4765c3bcd4702b65756fedbd452252201a68f46cbdbdfd92e6b12765da'
            '7752c9bcf60a857053b3a4262a40dd6ed2997044814dfb39e19cfa7108bcdfe4'
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
	cp -r $srcdir/$pkgname-$pkgver/resources/* "$pkgdir/usr/share/turbowarp-desktop"
}
