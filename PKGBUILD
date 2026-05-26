# Maintainer: Andrew <itspixelatd@proton.me>
pkgname=arch-scripts
pkgver=0.4.3
pkgrel=1
pkgdesc="A useful CLI tool to do stuff in Arch Linux."
arch=('any')
url="https://github.com/pixelated11/arch-scripts"
license=('GPL3')
depends=('python' 'systemd' 'pacman')
optdepends=('yay: for AUR updates' 'paru: for AUR updates')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pixelated11/arch-scripts/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 main.py "$pkgdir/usr/lib/arch-scripts/main.py"
    install -Dm644 config.py "$pkgdir/usr/lib/arch-scripts/config.py"
    install -Dm644 update.py "$pkgdir/usr/lib/arch-scripts/update.py"

    # Create a launcher script
    mkdir -p "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/arch-scripts" << 'EOF'
#!/bin/bash
exec python /usr/lib/arch-scripts/main.py "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/arch-scripts"
}