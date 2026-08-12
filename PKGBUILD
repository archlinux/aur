# Maintainer: liixini <https://github.com/liixini>
pkgname=skwd-daemon-bin
_pkgname=skwd-daemon
pkgver=r90.4f6c36d
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
sha256sums=('aeffa468361d2de4816a20d963c99ed43076f9ecc54ed699d8cb8960d19bd9c4')

package() {
  cd "$_pkgname-$pkgver-x86_64"

  install -Dm755 bin/skwd-daemon      "$pkgdir/usr/bin/skwd-daemon"
  install -Dm755 bin/skwd             "$pkgdir/usr/bin/skwd"
  install -Dm755 bin/skwd-paper       "$pkgdir/usr/bin/skwd-paper"
  install -Dm755 bin/skwd-paper-still "$pkgdir/usr/bin/skwd-paper-still"

  install -Dm644 lib/libsteam_api.so "$pkgdir/usr/lib/skwd-daemon/libsteam_api.so"

  install -Dm644 data/skwd-daemon.service "$pkgdir/usr/lib/systemd/user/skwd-daemon.service"
  install -Dm644 data/host/shell.qml      "$pkgdir/usr/share/skwd/skwd-daemon/host/shell.qml"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
