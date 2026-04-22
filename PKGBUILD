# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from Gemini 3 Flash.
pkgname=vykar-gui-bin
pkgver=0.12.15
pkgrel=1
pkgdesc="Desktop GUI for Vykar backup — Slint-based, with system tray and scheduled backups"
arch=('x86_64' 'aarch64')
options=('!debug')
install="${pkgname}.install"
url="https://github.com/borgbase/vykar"
license=('GPL-3.0-only')
depends=('fontconfig' 'libxkbcommon' 'libgl' 'xdotool')
provides=('vykar-gui')
conflicts=('vykar-gui')
source=("vykar-v${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz::https://github.com/borgbase/vykar/releases/download/v${pkgver}/vykar-v${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('179fbc43898ea8a4611f58b0dfbb5b4cec821194c076909f8a0a8402d96539b4')
sha256sums_aarch64=('3f54655050f106609b96d1878d58bd93c0dbc3b6f97e90de1c17a6ddee96fba8')

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
