# Maintainer: guglovich <https://github.com/guglovich>
# Created with assistance from Claude (Anthropic).
pkgname=transmission-remote-slint-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="Lightweight Transmission BitTorrent GUI built with Slint (no GTK) — prebuilt binary"
arch=('x86_64')
url="https://github.com/guglovich/Transmission-Remote-Slint"
license=('GPL-2.0-or-later')
depends=(
    'transmission-cli'
    'libxcb'
    'libxkbcommon'
    'fontconfig'
    'freetype2'
    'dbus'
)
optdepends=(
    'zenity: file picker dialogs (GNOME/X11)'
    'kdialog: file picker dialogs (KDE)'
    'yad: file picker dialogs (alternative)'
    'libnotify: desktop notifications'
    'snixembed: system tray support in XFCE/Openbox'
    'xfce4-statusnotifier-plugin: system tray support in XFCE'
)
provides=('transmission-remote-slint')
conflicts=('transmission-remote-slint')
source=("transmission-remote-slint::https://github.com/guglovich/Transmission-Remote-Slint/releases/download/v${pkgver}/transmission-remote-slint")
sha256sums=('2301b1749e172a74db455c9f19b17ccf665894276bb6f3df8d8c266b3704e0ca')

package() {
    install -Dm755 transmission-remote-slint \
        "$pkgdir/usr/bin/transmission-remote-slint"

    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/transmission-remote-slint.desktop" <<'DESKTOP'
[Desktop Entry]
Type=Application
Name=Transmission Remote
GenericName=BitTorrent Client
Comment=Lightweight Transmission GUI (Slint, no GTK)
Exec=transmission-remote-slint %f
Icon=transmission
Terminal=false
Categories=Network;FileTransfer;P2P;
MimeType=application/x-bittorrent;x-scheme-handler/magnet;
Keywords=torrent;bittorrent;transmission;download;
StartupWMClass=transmission-remote-slint
DESKTOP
}
