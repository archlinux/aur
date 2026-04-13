# Maintainer: guglovich <твой@email.com>
# Created with assistance from Claude (Anthropic)
pkgname=vykar-gui-bin
pkgver=0.12.12
pkgrel=1
pkgdesc="Desktop GUI for Vykar backup — Slint-based, with system tray and scheduled backups"
arch=('x86_64')
options=('!debug')
url="https://github.com/borgbase/vykar"
license=('GPL-3.0-only')
depends=('fontconfig' 'libxkbcommon' 'libgl' 'xdo')
provides=('vykar-gui')
conflicts=('vykar-gui')
source=("vykar-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/borgbase/vykar/releases/download/v${pkgver}/vykar-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('9eb85740dc0455097b6bb4eb0a8ec45ab5ad1c177ad913bd84745cfd14e75dbe')

package() {
    cd "$srcdir"
    install -Dm755 vykar-gui "$pkgdir/usr/bin/vykar-gui"

    # .desktop файл чтобы GUI появился в меню приложений
    install -dm755 "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/vykar-gui.desktop" <<EOF
[Desktop Entry]
Name=Vykar Backup
Comment=Desktop GUI for Vykar backup
Exec=vykar-gui
Icon=utilities-file-archiver
Terminal=false
Type=Application
Categories=Utility;Archiving;
EOF
}