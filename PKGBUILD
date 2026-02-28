# Maintainer: Regaan <regaan48@gmail.com>
pkgname=wshawk
_pkgname=wshawk
pkgver=3.0.2
pkgrel=1
pkgdesc="Enterprise-grade WebSocket security scanner & Web Penetration Testing Toolkit (Binary Release)"
arch=('x86_64')
url="https://github.com/noobforanonymous/wshawk"
license=('ISC')
depends=('nss' 'alsa-lib' 'gtk3' 'libxss')
options=(!strip !debug)
provides=('wshawk-desktop')
conflicts=('wshawk-git')
source=("${pkgname}-${pkgver}.pacman::https://github.com/noobforanonymous/wshawk/releases/download/v${pkgver}/wshawk-${pkgver}.pacman"
        "logo.jpg::https://raw.githubusercontent.com/noobforanonymous/wshawk/main/desktop/src/assets/logo.jpg")
sha256sums=('a2efef42b739e1abcdcf3eb677d8f5ca1f2367cd5baad426217f1d79c9c01d57'
            'SKIP') # Skipping logo hash for now to get it working immediately

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
  
  # Install the logo icon (downloaded via source array)
  install -Dm644 "logo.jpg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/wshawk.jpg"

  msg2 "Terminal symlinks and icons created successfully."
}
