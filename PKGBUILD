# Maintainer: Jozef Gaal <preklady@mayday.sk>
pkgname=pakchan
pkgver=1.0.0
pkgrel=1
pkgdesc="GTK4 package manager for Arch/Manjaro with real changelogs for Pacman, AUR, Flatpak, and Snap"
arch=('any')
url="https://github.com/dodog/pakchan"
license=('MIT')
depends=('python-gobject' 'gtk4' 'libadwaita' 'pacman-contrib')
optdepends=('yay: AUR update detection'
            'paru: AUR update detection (alternative to yay)'
            'flatpak: Flatpak update detection'
            'vte4: embedded terminal for update output')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dodog/pakchan/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9650d64553f7ff9c7e8ed646d2806b679d8f30ae0095d7e4efce785fa879f064')

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # Main script, installed under /usr/share and launched via a thin wrapper
    install -Dm755 pakchan.py "$pkgdir/usr/share/$pkgname/pakchan.py"
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/pakchan" <<'EOF'
#!/bin/sh
exec python3 /usr/share/pakchan/pakchan.py "$@"
EOF

    # Desktop launcher + icons
    install -Dm644 sk.mayday.pakchan.desktop "$pkgdir/usr/share/applications/sk.mayday.pakchan.desktop"
    install -Dm644 icons/sk.mayday.pakchan.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/sk.mayday.pakchan.svg"
    install -Dm644 icons/sk.mayday.pakchan.png "$pkgdir/usr/share/icons/hicolor/64x64/apps/sk.mayday.pakchan.png"

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
