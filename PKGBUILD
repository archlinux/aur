# Maintainer: dimflix <dimflix.official@gmail.com>
pkgname=mewline-qs
pkgver=2.5.0
pkgrel=1
pkgdesc="Quickshell shell for Hyprland, niri and bspwm — bar, widgets and menus (successor of mewline)"
arch=('any')
url="https://github.com/meowrch/mewline-qs"
license=('GPL-3.0-only')
depends=('quickshell')
optdepends=(
  'python: runtime helper scripts and peripheral battery polling'
  'python-dbus: Bluetooth battery levels via BlueZ Battery1'
  'bspwm: X11 window management (required on bspwm)'
  'sxhkd: X11 hotkey daemon for the widget binds (required on bspwm)'
  'picom: X11 compositor (required on bspwm: corners, blur, animations)'
  'xdotool: X11 window tagging and keyboard handover (required on bspwm)'
  'xorg-xrandr: monitor refresh detection on X11'
  'xorg-xprop: window enumeration for the bspwm autostart module'
  'xorg-xdpyinfo: screen size detection in the bspwm autostart module'
  'feh: X11 wallpaper setting'
  'hyprland: Wayland window management (required on Hyprland)'
  'cava: audio visualizer for the music widget'
  'cliphist: clipboard history'
  'brightnessctl: brightness control'
  'grim: screenshots'
  'slurp: screenshot region selection'
  'maim: X11 screenshots'
  'slop: screen-recording region selection (X11)'
  'satty: screenshot annotation and editing'
  'wf-recorder: Wayland screen recording'
  'ffmpeg: screen recording (x11grab on X11)'
  'pawlette: palette/theme engine the shell follows live'
)
install=mewline-qs.install
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('530daa3bd6d33107bc98fe95ce0bddd3c15c6eb361b1200733dc4953390793ed')

package() {
  cd "$srcdir/mewline-qs-$pkgver"

  # The shell is self-contained: config/quickshell carries the QML tree,
  # assets and every runtime helper script. Launch it with:
  #   quickshell -p /usr/share/mewline-qs/quickshell
  install -dm755 "$pkgdir/usr/share/mewline-qs"
  cp -r config/quickshell "$pkgdir/usr/share/mewline-qs/quickshell"

  # bspwm integration: autostart module (window tagging + keyboard
  # handover), picom rules and the sxhkdrc fragment.
  cp -r config/bspwm "$pkgdir/usr/share/mewline-qs/bspwm"

  install -Dm644 README.md "$pkgdir/usr/share/doc/mewline-qs/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/doc/mewline-qs/LICENSE"
}
