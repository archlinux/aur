# Maintainer: Bobee <bogdan.mosteanu@hey.com>
pkgname=mounty
pkgver=1.0.1
pkgrel=1
pkgdesc="A Linux GTK4 application for managing network shares with fstab integration"
arch=('any')
url="https://github.com/xndbogdan/mounty"
license=('MIT')
depends=(
    'python>=3.10'
    'python-gobject'
    'gtk4'
    'libadwaita'
    'smbclient'
    'cifs-utils'
    'polkit'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/xndbogdan/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$pkgname-$pkgver"
    
    install -Dm644 mounty.py "$pkgdir/usr/lib/mounty/mounty.py"
    install -Dm644 share_manager.py "$pkgdir/usr/lib/mounty/share_manager.py"
    
    install -dm755 "$pkgdir/usr/lib/mounty/ui"
    install -Dm644 ui/__init__.py "$pkgdir/usr/lib/mounty/ui/__init__.py"
    install -Dm644 ui/main_window.py "$pkgdir/usr/lib/mounty/ui/main_window.py"
    install -Dm644 ui/share_dialog.py "$pkgdir/usr/lib/mounty/ui/share_dialog.py"
    install -Dm644 ui/share_row.py "$pkgdir/usr/lib/mounty/ui/share_row.py"
    
    install -Dm644 mounty.desktop "$pkgdir/usr/share/applications/mounty.desktop"
    install -Dm644 icon.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/mounty.png"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/mounty" << 'EOF'
#!/bin/bash
cd /usr/lib/mounty
exec python3 mounty.py "$@"
EOF
}
