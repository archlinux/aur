# Maintainer: mellen9999
# the signed prebuilt release from github, no compiling. packaging/aur.sh refreshes the release files
# below (and .SRCINFO) for a new tag, then publishes. the app inside updates through pacman, not itself
pkgname=heatsync-chat-bin
_name=heatsync-chat
pkgver=0.4.22
pkgrel=1
pkgdesc='twitch, kick and youtube chat in one native window, with heatsync emotes (prebuilt release)'
url='https://github.com/mellen9999/heatsync-chat'
license=(MIT)
depends=(glibc fontconfig libxkbcommon wayland)
optdepends=(
  'libnotify: desktop notification on an @mention'
  'xdg-utils: open the login page and links'
  'zenity: file dialog for uploads'
  'wl-clipboard: copy and paste on wayland'
  'xclip: copy and paste on x11'
  'libx11: x11 sessions'
  'mpv: video links play in their own window'
  'yt-dlp: lets mpv play youtube and clip links'
  'pipewire: the mention sound (paplay or aplay work too)'
)
provides=("$_name=$pkgver")
conflicts=("$_name")
# the binary arrives stripped and signed off by the release: leave its bytes alone
options=(!strip !debug)
source_x86_64=("$_name-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$_name-x86_64-linux.tar.gz")
source_aarch64=("$_name-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/$_name-aarch64-linux.tar.gz")
# >>> release files: packaging/aur.sh rewrites these lines, don't edit by hand
arch=(x86_64 aarch64)
sha256sums_x86_64=('c86c375079374dfd37a5898ff1719865ae0dfb3010c7999572e0b23bab04fe48')
sha256sums_aarch64=('df0ee7e0da758a586d0bd43f227f32effb31df3e5dfac7f4d139e5adec1c1852')
# <<<

package() {
  cd "$srcdir/$_name"
  install -Dm755 heatsync-chat "$pkgdir/usr/bin/heatsync-chat"
  install -Dm644 heatsync-chat.desktop "$pkgdir/usr/share/applications/heatsync-chat.desktop"
  install -Dm644 icon-48.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/heatsync-chat.png"
  install -Dm644 icon-96.png "$pkgdir/usr/share/icons/hicolor/96x96/apps/heatsync-chat.png"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
