# Maintainer: Alan Sikora <alan@techfx.com.br>
pkgname=omarchy-workspace-profiles
pkgver=0.1.0
pkgrel=1
pkgdesc="Named workspace profiles for Omarchy on Hyprland — per-profile browser, mako rules, waybar widget, and SUPER+1..5 slots"
arch=('any')
url="https://github.com/alansikora/omarchy-workspace-profiles"
license=('MIT')
depends=('bash' 'python' 'hyprland' 'waybar' 'mako' 'xdg-utils' 'libnotify' 'jq')
optdepends=(
  'chromium: per-profile browser backend'
  'google-chrome: per-profile browser backend'
)
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b09eef2caf15c3fe3ac8ad21aa8f50ee003704959cb69704a512edab60780821')

package() {
  cd "$pkgname-$pkgver"

  # Scripts
  install -Dm755 bin/omarchy-setup-workspace-profiles "$pkgdir/usr/bin/omarchy-setup-workspace-profiles"
  install -Dm755 bin/omarchy-workspace-profile        "$pkgdir/usr/bin/omarchy-workspace-profile"
  install -Dm755 bin/omarchy-workspace-profile-sync   "$pkgdir/usr/bin/omarchy-workspace-profile-sync"
  install -Dm755 bin/workspace-profile-browser        "$pkgdir/usr/bin/workspace-profile-browser"

  # Config templates — setup script reads them from $PKG_DATADIR/config/...
  install -Dm644 config/hypr/workspace-profiles.conf            "$pkgdir/usr/share/$pkgname/config/hypr/workspace-profiles.conf"
  install -Dm644 config/hypr/workspace-profiles-autostart.conf  "$pkgdir/usr/share/$pkgname/config/hypr/workspace-profiles-autostart.conf"
  install -Dm644 config/waybar/workspace-profiles.css           "$pkgdir/usr/share/$pkgname/config/waybar/workspace-profiles.css"
  install -Dm644 config/waybar/workspace-profiles.jsonc         "$pkgdir/usr/share/$pkgname/config/waybar/workspace-profiles.jsonc"
  install -Dm644 config/omarchy/extensions/workspace-profiles.sh "$pkgdir/usr/share/$pkgname/config/omarchy/extensions/workspace-profiles.sh"

  # Docs + license
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
