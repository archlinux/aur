# pkgver is kept in sync with pubspec.yaml by .github/workflows/version-bump.yml (same as Android).
# Binary URL uses v${pkgver} GitHub Release — CI publishes to AUR after each release if AUR_SSH_PRIVATE_KEY is set.

pkgname=asteriaray-bin
pkgver=1.0.24
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
sha256sums=('408742e644a84d2bcf2b21d9c47ffdaceee8aee37291016778f93c5b57fd76b7')

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
