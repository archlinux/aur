# Maintainer: diode701 <undeadsan7@gmail.com>
pkgname=nyaa-paper-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Linux Wallpaper Engine frontend with a keyboard‑first GUI"
arch=('any')
url="https://github.com/diode701/nyaa-paper"
license=('CC-BY-NC-4.0')
depends=('java-runtime>=17')
optdepends=('linux-wallpaperengine: the backend that actually renders wallpapers')
source=("$pkgname-$pkgver.tar.gz::https://github.com/diode701/nyaa-paper/releases/download/v$pkgver/nyaa-paper-$pkgver.tar.gz")
sha256sums=('57bb2bb69e5299ad972f9da04cf1d1bc0ee0b9c99bde17fa968f6898b163e560')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    # Fix path to match where PKGBUILD installs
    sed -i "s|/usr/share/nyaa-paper/|/usr/share/$pkgname/|g" bin/nyaa-paper
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm644 lib/nyaa-paper-launcher.jar "$pkgdir/usr/share/$pkgname/nyaa-paper-launcher.jar"
    install -Dm644 lib/nyaa-paper-app.jar "$pkgdir/usr/share/$pkgname/nyaa-paper-app.jar"
    install -Dm644 icon.png "$pkgdir/usr/share/$pkgname/icon.png"
    install -Dm755 bin/nyaa-paper "$pkgdir/usr/bin/nyaa-paper"
    install -Dm755 install.sh "$pkgdir/usr/share/$pkgname/install.sh"
    install -Dm755 uninstall.sh "$pkgdir/usr/share/$pkgname/uninstall.sh"

    # .desktop file so the app appears in the system launcher
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/nyaa-paper.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=Nyaa Paper
Comment=Linux Wallpaper Engine frontend with a keyboard-first GUI
Exec=nyaa-paper
Icon=/usr/share/$pkgname/icon.png
Terminal=false
Categories=Utility;Graphics;
EOF
}
