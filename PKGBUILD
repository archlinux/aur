# Maintainer: Helmut Januschka <helmut@januschka.com>

pkgname=omarchy-chromium-bin
pkgver=139.0.7258.66
pkgrel=3
pkgdesc="A web browser built for speed, simplicity, and security, with patches for Omarchy (binary)"
arch=('x86_64')
url="https://www.chromium.org/Home"
license=('BSD-3-Clause')
depends=('gtk3' 'nss' 'alsa-lib' 'xdg-utils' 'libxss' 'libcups' 'libgcrypt'
         'ttf-liberation' 'systemd' 'dbus' 'libpulse' 'pciutils' 'libva'
         'libffi' 'desktop-file-utils' 'hicolor-icon-theme' 'brotli' 'flac'
         'fontconfig' 'freetype2' 'harfbuzz' 'libjpeg-turbo' 'libpng' 'libwebp'
         'libxml2' 'libxslt' 'opus' 'minizip')
optdepends=('pipewire: WebRTC desktop sharing under Wayland'
            'kdialog: support for native dialogs in Plasma'
            'gtk4: for --gtk-version=4 (GTK4 IME might work better on Wayland)'
            'org.freedesktop.secrets: password storage backend on GNOME / Xfce'
            'kwallet: support for storing passwords in KWallet on Plasma'
            'upower: Battery Status API support')
conflicts=('omarchy-chromium')
provides=('chromium' 'omarchy-chromium')

source=("https://github.com/hjanuschka/omarchy-chromium/releases/download/${pkgver}-${pkgrel}/chromium-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
sha256sums=('SKIP')


package() {
  # Extract the binary package
  cd "$srcdir"
  bsdtar -xf "chromium-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst"
  
  # Copy all extracted files to the package directory
  cp -r usr/ "$pkgdir/"
  
  # Ensure correct permissions
  chmod 755 "$pkgdir/usr/lib/chromium/chromium"
  chmod 4755 "$pkgdir/usr/lib/chromium/chrome-sandbox"
}

# vim:set ts=2 sw=2 et:
