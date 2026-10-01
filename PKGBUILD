# Maintainer: whysooraj <whysooraj.official@gmail.com>
pkgname=tide-island
pkgver=1.0.40
pkgrel=1
_srcdir=Tide-island-$pkgver
_builddir=build-$pkgver
pkgdesc="A dynamic island for Hyprland and niri using Quickshell"
arch=('x86_64')
url="https://github.com/enhaoswen/Tide-island"
license=('GPL-3.0-only')
depends=(
    'qt6-base'
    'qt6-declarative'
    'qt6-5compat'
    'qt6-wayland'
    'qt6-connectivity'
    'qt6-svg'
    'wireplumber'
    'pipewire'
    'dbus'
    'xdg-utils'
    'libpulse'
    'systemd'
    'brightnessctl'
    'upower'
    'bluez'
    'bluez-utils'
    'quickshell'
    'cliphist'
    'wl-clipboard'
)
makedepends=('cmake')
options=('!debug' '!strip')
optdepends=(
    'hyprland: for Hyprland compositor integration'
    'niri: for niri compositor integration'
    'hyprsunset: for Night Light on Hyprland'
    'gammastep: for Night Light on niri or generic Wayland sessions'
    'cava: for audio visualizer'
    'imagemagick: for wallpaper thumbnails'
    'awww: for applying wallpapers from the wallpaper picker'
    'python-pywal: for generating colors from the selected wallpaper'
    'networkmanager: for wifi control'
    'iwd: for wifi control'
    'swaync: for the Focus do-not-disturb toggle'
    'power-profiles-daemon: for power profile controls via powerprofilesctl'
    'tlp: for TLP power profile controls'
    'polkit: for applying TLP profiles via pkexec'
    'sudo: alternative for applying TLP profiles'
    'zenity: for Ask-mode TLP password prompts when no Polkit agent is running'
)
conflicts=('tide-island-git')
install='tide-island.install'
source=("$pkgname-$pkgver.tar.xz::https://github.com/enhaoswen/Tide-island/releases/download/$pkgver/tide-island-source.tar.xz")
sha256sums=('186b0227cbe25b514d9604f19d5a2247de43dd56afe4bc66b3c72d14de3f46b7')

build() {
  cmake -S "$_srcdir" -B "$_builddir" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  cmake --build "$_builddir"
}

package() {
  DESTDIR="$pkgdir" cmake --install "$_builddir"
  rm -f "$pkgdir/usr/lib/qt6/qml/TideIsland/tide-island-config-app_qml_module_dir_map.qrc"
  chmod +x "$pkgdir/usr/bin/tide-island"
  chmod +x "$pkgdir/usr/bin/tide-island-config-app"
  chmod +x "$pkgdir/usr/share/tide-island/bin/lyricsmpris"
}
