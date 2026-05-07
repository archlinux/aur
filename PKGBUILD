# Maintainer: diode701 <undeadsan7@gmail.com>
pkgname=nyaa-paper-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Linux Wallpaper Engine frontend with a keyboard‑first GUI"
arch=('any')
url="https://github.com/diode701/nyaa-paper"
license=('AGPL-3.0-only')
depends=('java-runtime>=21')
optdepends=('linux-wallpaperengine: the backend that actually renders wallpapers')
source=("$pkgname-$pkgver.tar.gz::https://github.com/diode701/nyaa-paper/releases/download/v$pkgver/nyaa-paper-$pkgver.tar.gz")
sha256sums=('4408bf2d29a08d2d5c98125e024a4a740ebc8592ed3cdcaa0771b4025f4c1beb ')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    sed -i "s|/usr/share/nyaa-paper/|/usr/share/$pkgname/|g" bin/nyaa-paper
}

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
