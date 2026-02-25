# Maintainer: Regaan <regaan48@gmail.com>
pkgname=wshawk
_pkgname=wshawk
pkgver=3.0.1
pkgrel=2
pkgdesc="Enterprise-grade WebSocket security scanner & Web Penetration Testing Toolkit (Binary Release)"
arch=('x86_64')
url="https://github.com/noobforanonymous/wshawk"
license=('ISC')
depends=('nss' 'alsa-lib' 'gtk3' 'libxss')
provides=('wshawk-desktop')
conflicts=('wshawk-git')
source=("${pkgname}-${pkgver}.pacman::https://github.com/noobforanonymous/wshawk/releases/download/v${pkgver}/wshawk-${pkgver}.pacman")
sha256sums=('71e2779332842c7900e00c4c7ea16f772473d451118716a96c75e85a6caf748c')

package() {
  msg2 "Extracting and installing binary assets..."
  
  if [ -d usr ]; then
    cp -rp usr "$pkgdir/"
  fi

  if [ -d opt ]; then
    cp -rp opt "$pkgdir/"
  fi
  
  # Ensure the sidecar has execute permissions
  find "$pkgdir" -name "wshawk-bridge" -exec chmod +x {} +

  # --- CREATE TERMINAL COMMANDS ---
  install -dm755 "$pkgdir/usr/bin"
  
  # Create symlink for wshawk-desktop and wshawk
  ln -sf /opt/WSHawk/wshawk "$pkgdir/usr/bin/wshawk-desktop"
  ln -sf /opt/WSHawk/wshawk "$pkgdir/usr/bin/wshawk"
  
  # Install the logo icon
  install -Dm644 "desktop/src/assets/logo.jpg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/wshawk.jpg"

  msg2 "Terminal symlinks and icons created successfully."
}
