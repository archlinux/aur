# Maintainer: smiley <smiley@archlinux.org>
pkgname=cosmic-control-center-applet-bin
_pkgname=cosmic-control-center-applet
pkgver=0.2.1
pkgrel=1
pkgdesc="Quick-Settings-style control center applet for the COSMIC panel (prebuilt binary)"
arch=('x86_64')
url="https://github.com/jjnuthuagen/cosmic-control-center-applet"
license=('Apache-2.0 OR MIT')
depends=('cosmic-panel' 'glibc' 'libgcc' 'libglvnd' 'libxkbcommon' 'wayland')
optdepends=('networkmanager: Wi-Fi, DNS and VPN tiles'
            'bluez: Bluetooth tile'
            'power-profiles-daemon: power profile tile'
            'upower: battery and charge limit tiles'
            'wireplumber: volume and microphone tiles'
            'libpulse: volume fallback via pactl'
            'gamemode: Game Mode tile')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname" "$_pkgname-git")
options=('!strip' '!debug')
source=("$_pkgname-$pkgver-x86_64-linux.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64-linux.tar.gz")
sha256sums=('be4213891f0aa2152dd0792cedc1b3dbe5e62e18fe0a13828c2deb2e97d02b8f')

package() {
  cd "$_pkgname-$pkgver-x86_64-linux"
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 -t "$pkgdir/usr/share/applications" *.desktop
  install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps" icons/*.svg
  install -Dm644 config.example.toml README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE-APACHE LICENSE-MIT -t "$pkgdir/usr/share/licenses/$pkgname"
}
