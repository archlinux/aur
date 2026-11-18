# Maintainer: dimflix <dimflix.official@gmail.com>
pkgname=mewline-qs
pkgver=1.0.0
pkgrel=1
pkgdesc="Quickshell shell for Hyprland and bspwm — bar, widgets and menus (successor of mewline)"
arch=('any')
url="https://github.com/meowrch/mewline-qs"
license=('GPL-3.0-only')
depends=('quickshell')
optdepends=(
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
sha256sums=('63a60453ea39a8ed85916d6f7ff35ffb53bb8850121a30028826dbaeb478f6ea')

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
