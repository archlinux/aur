# Maintainer: Jozef Gaal <preklady@mayday.sk>
pkgname=pakchan
pkgver=2.1.2
pkgrel=1
pkgdesc="GTK4 package manager for Manjaro/Arch with real changelogs for Pacman, AUR, Flatpak, and Snap"
arch=('any')
url="https://github.com/dodog/pakchan"
license=('MIT')
depends=('python' 'python-gobject' 'gtk4' 'libadwaita>=1.5' 'pacman-contrib' 'polkit')
optdepends=('yay: AUR install and update detection'
            'paru: AUR install and update detection (alternative to yay)'
            'git: AUR PKGBUILD review and git-based changelog fallback'
            'flatpak: Flatpak search, install and update detection'
            'snapd: Snap support'
            'vte4: embedded terminal for update output')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dodog/pakchan/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('40cb747cf60b01204c6c7ff99656be622f49c9e85581ee20bb44b6394127c2b1')

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
