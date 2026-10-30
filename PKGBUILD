# Maintainer: pruefsumme <194605914+pruefsumme@users.noreply.github.com>

pkgname=mavernix
pkgver=0.5.3
pkgrel=1
pkgdesc='A lightweight Wayland desktop session with a classic look'
arch=('x86_64')
url='https://github.com/Mavernix/mavernix'
license=('GPL-3.0-or-later' 'MIT')
depends=(
  'wayfire>=0.11.0' 'wayfire<0.12'
  'quickshell'
  'qt6-base' 'qt6-declarative' 'qt6-multimedia' 'qt6-wayland' 'qt6-svg'
  'librsvg' 'glib2' 'tomlplusplus'
  'python' 'python-pillow'
  'kvantum'
  'gsettings-desktop-schemas'
  'gvfs'
  'adwaita-icon-theme' 'adwaita-icon-theme-legacy' 'adwaita-cursors' 'ttf-dejavu'
  '7zip' 'cpio' 'bzip2' 'lbzip2' 'libicns' 'ffmpeg' 'poppler' 'bubblewrap'
)
makedepends=('meson' 'ninja' 'glm' 'vulkan-headers')
optdepends=(
  'foot: the terminal the dock and Super+Enter open'
  "pipewire: sound, and the panel's volume item"
  'wireplumber: sound'
  "networkmanager: the panel's network item"
  "bluez: the panel's Bluetooth item"
  "upower: the panel's battery item"
  'grim: pictures of the screen'
  'slurp: pictures of a part of the screen'
  'wl-clipboard: pictures of the screen into the clipboard'
  'brightnessctl: brightness keys'
  'playerctl: media keys'
  'network-manager-applet: asking for a network password NetworkManager needs again, and networks that sign in with a user name or a certificate'
  'dex: starting the programs in ~/.config/autostart'
  "hwdata: the graphics card's name in About This Computer"
  'xdg-desktop-portal-gtk: file choosers for sandboxed programs'
  'xdg-desktop-portal-wlr: screen sharing'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d0dca107fa4cc6f91af6275633070e4ac0a80fdfd5b8d6c91fe3ad681ee37094')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"

  install -Dm644 "$pkgname-$pkgver/src/compositor/decoration/LICENSE-wayfire" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-wayfire"
}
