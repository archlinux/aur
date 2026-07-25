# Maintainer: Sean Stoves <sean@seanstoves.com>

# Repacks the official .deb from the KilnMUD-Releases repo. Source is private, so
# per the nonfree AUR rules this is unsuffixed (not -bin).
# Releases: https://github.com/SeanStoves/KilnMUD-Releases/releases

pkgname=kilnmud
pkgver=0.24.0
pkgrel=1
pkgdesc="Cross-platform MUD client built on Tauri 2"
arch=('x86_64')
url="https://github.com/SeanStoves/KilnMUD-Releases"
license=('LicenseRef-proprietary')
depends=('webkit2gtk-4.1' 'gtk3' 'gdk-pixbuf2' 'cairo' 'glib2' 'dbus' 'libsoup3'
         'gcc-libs' 'glibc' 'hicolor-icon-theme')
options=('!strip' '!debug')
source=("https://github.com/SeanStoves/KilnMUD-Releases/releases/download/v${pkgver}/KilnMUD_${pkgver}_amd64.deb")
sha256sums=('b8934f33f827f6b6414b96da508dc9ec6af22134e2ad4a7e6b3d4af1fe159592')

package() {
    # makepkg already unpacked the .deb (ar archive) into srcdir
    bsdtar -xf data.tar.* -C "$pkgdir"

    # upstream ships an empty Categories= so it lands nowhere in app menus
    sed -i 's/^Categories=$/Categories=Game;RolePlaying;/' "$pkgdir/usr/share/applications/KilnMUD.desktop"

    install -Dm644 /dev/stdin "$pkgdir/usr/share/licenses/$pkgname/LICENSE" <<'EOF'
KilnMUD is proprietary software. Copyright (c) Sean Stoves. All rights reserved.

Repackaged unmodified from the official binary release:
https://github.com/SeanStoves/KilnMUD-Releases/releases
EOF
}
