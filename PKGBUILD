# Maintainer: kaukauk <kaustubhkarthik@gmail.com>
pkgname=blurt
pkgver=0.1.3
pkgrel=1
pkgdesc="Fast, local, push-to-toggle speech-to-text dictation (Whisper) that types into the focused window"
arch=('any')
url="https://github.com/kaukauk/blurt"
license=('MIT')
install="$pkgname.install"
depends=(
  'python'
  'python-faster-whisper'
  'python-ctranslate2'
  'python-sounddevice'
  'python-numpy'
  'python-xlib'
  'python-gobject'
  'python-cairo'
  'gtk3'
  'glib2'
  'libnotify'
  'xdg-utils'
)
optdepends=(
  'xdotool: typing + global hotkeys on X11 (recommended)'
  'wtype: typing on Wayland'
  'ydotool: typing on Wayland (alternative)'
  'xclip: copy transcription to clipboard on X11'
  'wl-clipboard: copy transcription to clipboard on Wayland'
)
# Note: the packaged python-ctranslate2 is CPU-only, so installing cuda/cudnn
# does NOT enable GPU. GPU needs the PyPI ctranslate2 wheel (see README).
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7e953f0dc3f75b2303ecc2c7d2dea7f99e9335836652f90e643aaccb2a1ad1c8')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -dm755 "$pkgdir/usr/lib/blurt/blurt"
  install -m644 -t "$pkgdir/usr/lib/blurt/blurt/" blurt/*.py
  install -Dm755 bin/blurt "$pkgdir/usr/bin/blurt"
  install -Dm644 data/blurt.service "$pkgdir/usr/lib/systemd/user/blurt.service"
  install -Dm644 data/blurt.desktop "$pkgdir/usr/share/applications/blurt.desktop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
