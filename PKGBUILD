# Maintainer: Daniel Azevedo <daniazevedo77@posteo.net>

pkgname=utumno
pkgver=0.5.0
pkgrel=1
pkgdesc="Quickshell desktop shell for Wayland compositors (bar, launcher, dashboard, greeter)"
arch=('any')
url="https://github.com/dani-77/utumno"
license=('MIT')
# Unlike the Void template, quickshell is listed here: an unversioned
# dependency never holds back pacman upgrades.
depends=('quickshell' 'power-profiles-daemon' 'alsa-utils' 'alsa-tools'
         'brightnessctl' 'wireless_tools' 'iw' 'curl' 'eww' 'dgop')
makedepends=('rsync')
optdepends=(
  'upower: battery widget'
  'networkmanager: network widget'
  'matugen: wallpaper-based color palette'
  'lm_sensors: CPU temperature in the dashboard (falls back to thermal_zone0)'
  'cmus: music controls in the dashboard and the music picker'
  'ffmpeg: album/artist tags in the music picker (ffprobe)'
  'tmux: start cmus headless from the dashboard'
  'screen: start cmus headless from the dashboard (if tmux is missing)'
  'xdg-user-dirs: music picker follows XDG_MUSIC_DIR'
  'greetd: native login greeter (greeter/, set up manually)'
  'dwl: compositor hosting the greeter (greeter/assets/greet-dwl.sh)'
  'xorg-xinit: X11 sessions from the greeter (startx)'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('6dc986f59cf257e5813d876557916a6989e82ea3ec0585b3538d76655e94f107')

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
