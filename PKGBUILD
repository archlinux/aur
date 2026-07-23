# Maintainer: amoyrlet <amoyrlet@proton.me>
pkgname=fygram-bin
pkgver=0.1.0
pkgrel=2
pkgdesc="Desktop music player that indexes and plays audio from your Telegram channels"
arch=('x86_64')
url="https://github.com/amoylret-git/fygram"
license=('Apache-2.0')
provides=('fygram')
conflicts=('fygram')
depends=('webkit2gtk-4.1' 'gtk3' 'alsa-lib' 'openssl' 'hicolor-icon-theme')
# a prebuilt binary has nothing to strip and no sources to point a debug
# package at, so makepkg's defaults only produce a broken fygram-bin-debug
options=('!strip' '!debug')
source=("fygram-arch-installer-${pkgver}.tar.gz::https://github.com/amoylret-git/fygram/releases/download/v${pkgver}/fygram-arch-installer.tar.gz")
sha256sums=('123a3cea29c30fe7d83015f004564d8221a03770b79e9c7f85d3372b626c7f9b')

package() {
  cd "$srcdir/fygram-arch"

  install -Dm755 fygram-arch-x86_64 "$pkgdir/usr/bin/fygram"
  install -Dm644 fygram.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/fygram.png"

  install -dm755 "$pkgdir/usr/share/applications"
  cat > "$pkgdir/usr/share/applications/fygram.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=fygram
Comment=${pkgdesc}
Exec=fygram
Icon=fygram
Terminal=false
Categories=AudioVideo;Audio;Player;
StartupWMClass=fygram
EOF
  chmod 644 "$pkgdir/usr/share/applications/fygram.desktop"
}
