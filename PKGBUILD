# Maintainer: mellen9999
# the signed prebuilt release from github, no compiling. packaging/aur.sh refreshes the release files
# below (and .SRCINFO) for a new tag, then publishes. the app inside updates through pacman, not itself
pkgname=heatsync-chat-bin
_name=heatsync-chat
pkgver=0.4.8
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
sha256sums_x86_64=('5bd1f438f9e086c4b5a0975a863705af11bad882838d6f87b95aac63bad0a330')
sha256sums_aarch64=('9ecfe2cddde8c99cae398c157218e859e7443ad19fa8db2e3173f2a5a02bb094')
# <<<

package() {
  cd "$srcdir/$_name"
  install -Dm755 heatsync-chat "$pkgdir/usr/bin/heatsync-chat"
  install -Dm644 heatsync-chat.desktop "$pkgdir/usr/share/applications/heatsync-chat.desktop"
  install -Dm644 icon-48.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/heatsync-chat.png"
  install -Dm644 icon-96.png "$pkgdir/usr/share/icons/hicolor/96x96/apps/heatsync-chat.png"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
