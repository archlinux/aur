# pkgver is kept in sync with pubspec.yaml by .github/workflows/version-bump.yml (same as Android).
# Binary URL uses v${pkgver} GitHub Release — CI publishes to AUR after each release if AUR_SSH_PRIVATE_KEY is set.

pkgname=asteriaray-bin
pkgver=1.0.27
pkgrel=1
pkgdesc='VPN client (VLESS / AmneziaWG) — Flutter Linux bundle'
arch=('x86_64')
url='https://github.com/Reei-dp/AsteriaRay'
license=('MIT')
depends=('gtk3' 'glib2' 'libsecret' 'libepoxy' 'hicolor-icon-theme' 'zenity' 'libcap' 'libayatana-appindicator' 'libdbusmenu-gtk3')
provides=('asteriaray')
conflicts=('asteriaray')
options=('!strip')
install='asteriaray-bin.install'
source=("asteriaray-${pkgver}-linux-x64.tar.xz::https://github.com/Reei-dp/AsteriaRay/releases/download/v${pkgver}/asteriaray-${pkgver}-linux-x64.tar.xz")
sha256sums=('43014e8c37c336b6ac327ee8b93c788d4dacf8c9b52a1850d22d355c9ff434cd')

package() {
  install -dm755 "$pkgdir/opt/asteriaray"
  cp -a "$srcdir"/* "$pkgdir/opt/asteriaray/"
  chmod +x "$pkgdir/opt/asteriaray/asteriaray"
  install -dm755 "$pkgdir/usr/bin"
  ln -sf /opt/asteriaray/asteriaray "$pkgdir/usr/bin/asteriaray"

  install -Dm644 "$pkgdir/opt/asteriaray/vpn.asteria.com.desktop" \
    "$pkgdir/usr/share/applications/vpn.asteria.com.desktop"
  install -Dm644 "$pkgdir/opt/asteriaray/icons/vpn.asteria.com.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/vpn.asteria.com.png"
  install -Dm644 "$pkgdir/opt/asteriaray/icons/vpn.asteria.com.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/vpn.asteria.com.png"
  install -Dm644 "$pkgdir/opt/asteriaray/icons/vpn.asteria.com.png" \
    "$pkgdir/usr/share/icons/hicolor/48x48/apps/vpn.asteria.com.png"
}
