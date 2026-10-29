# Maintainer: tuklu
# The CI release binary, so installing needs no Go and no GTK binding compile.
pkgname=nzlauncher-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="Launcher for Hyprland that learns how you use it (prebuilt)"
arch=('x86_64')
url="https://github.com/tuklu/nZlauncher"
license=('MIT')
depends=('gtk4' 'gtk4-layer-shell' 'glib2' 'hyprland')
optdepends=(
  'ghostty: TUI face'
  'cliphist: clipboard provider'
  'wl-clipboard: clipboard provider, copying results'
  'bluez-utils: bluetooth connect and power'
  'iwd: wifi provider (or networkmanager)'
  'networkmanager: wifi provider (or iwd)'
  'hyprsunset: nightlight'
  'power-profiles-daemon: power profiles (tlp-pd or tuned-ppd work too)'
  'fd: file search before the daemon has built its index'
  'fzf: nzlauncher pick'
  'hyprmoncfg: monitor provider'
  'swaybg: default wallpaper command'
)
provides=('nzlauncher')
conflicts=('nzlauncher' 'nzlauncher-git')
options=('!strip' '!debug')
source=("nzlauncher-$pkgver::$url/releases/download/v$pkgver/nzlauncher-linux-amd64"
        "nzlauncher-gtk-$pkgver::$url/releases/download/v$pkgver/nzlauncher-gtk-linux-amd64"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/tuklu/nZlauncher/v$pkgver/LICENSE"
        "nzlauncher-$pkgver.service::https://raw.githubusercontent.com/tuklu/nZlauncher/v$pkgver/packaging/systemd/nzlauncher.service")
sha256sums=('c606e7dd49f801470ac7159b0aed3c58f0371cd869f59aeee13b78ea758c50ab'
            'c10410a38200c680576e9c2325d34629d817963a3d1f76d515e5356355c26ac7'
            'cffff6a257a267deefebc1866d636e5f1bd098550007dcd75e8de8fbb38375dc'
            '0a66c4572ddf8c6759815f211d3838a5bdb91da3f971cda0ddfe7b6fcb9b1c9d')

package() {
  install -Dm755 "nzlauncher-$pkgver" "$pkgdir/usr/bin/nzlauncher"
  install -Dm755 "nzlauncher-gtk-$pkgver" "$pkgdir/usr/bin/nzlauncher-gtk"
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "nzlauncher-$pkgver.service" "$pkgdir/usr/lib/systemd/user/nzlauncher.service"
}
