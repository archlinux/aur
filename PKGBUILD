# Maintainer: liixini <https://github.com/liixini>
pkgname=skwd-daemon-bin
_pkgname=skwd-daemon
pkgver=r92.577f9ea
pkgrel=1
pkgdesc='Daemon for Skwd Shell, a collection of Quickshell programs and widgets precompiled'
arch=('x86_64')
url='https://github.com/liixini/skwd-daemon'
license=('MIT')
depends=('gcc-libs' 'imagemagick' 'ffmpeg' 'alsa-lib' 'libpulse' 'wayland' 'mesa' 'qt6-tools')
optdepends=(
  'ollama: local LLM for automated wallpaper tagging'
  'steamcmd: Steam Workshop Wallpaper Engine downloads when the Steam client is not running'
  'linux-wallpaperengine: Wallpaper Engine scene rendering'
)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname" "$_pkgname-debug")
options=('!debug' '!strip')
install="$_pkgname.install"
source=("$_pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/$_pkgname-$pkgver-x86_64.tar.gz")
sha256sums=('313e3342b47739b221323522093546f900569069f2c973ec4184870929abbb76')

package() {
  cd "$_pkgname-$pkgver-x86_64"

  install -Dm755 bin/skwd-daemon      "$pkgdir/usr/bin/skwd-daemon"
  install -Dm755 bin/skwd             "$pkgdir/usr/bin/skwd"
  install -Dm755 bin/skwd-paper       "$pkgdir/usr/bin/skwd-paper"
  install -Dm755 bin/skwd-paper-still "$pkgdir/usr/bin/skwd-paper-still"

  install -d "$pkgdir/usr/lib/skwd-daemon"
  cp -a lib/skwd-daemon/. "$pkgdir/usr/lib/skwd-daemon/"

  install -Dm644 data/skwd-daemon.service "$pkgdir/usr/lib/systemd/user/skwd-daemon.service"
  install -Dm644 data/host/shell.qml      "$pkgdir/usr/share/skwd/skwd-daemon/host/shell.qml"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -d "$pkgdir/usr/share/licenses/$pkgname/ffmpeg"
  cp -a share/licenses/ffmpeg/. "$pkgdir/usr/share/licenses/$pkgname/ffmpeg/"
}
