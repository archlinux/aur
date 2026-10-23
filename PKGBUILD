# Maintainer: Sergiu Puscas <srg.pscs@gmail.com>

pkgname=faro-bin
_pkgname=faro
pkgver=0.1.5
pkgrel=1
pkgdesc='Terminal client for Signal, built for people who live in tmux (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://getfaro.dev'
license=('AGPL-3.0-only' 'MIT')
# The release archives link OpenSSL statically (D133), so no openssl dep;
# they are built on Ubuntu 22.04, so glibc >= 2.35 (Arch is far newer).
depends=('glibc' 'libgcc')
optdepends=(
  'xdg-utils: open links and attachments'
  'mpv: play voice notes (or ffmpeg, pipewire, alsa-utils)'
  'ffmpeg: read voice notes that are not WAV'
  'python-openai-whisper: transcribe voice notes locally (the default command)'
  'whisper-cpp: transcribe voice notes locally (whisper-cli)'
  'libsecret: read the remote transcription API key from the keyring'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
# The dist archives hold already-stripped release binaries.
options=('!strip' '!debug')
source_x86_64=("$_pkgname-x86_64-unknown-linux-gnu-$pkgver.tar.xz::https://github.com/harababurel/faro/releases/download/v$pkgver/$_pkgname-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("$_pkgname-aarch64-unknown-linux-gnu-$pkgver.tar.xz::https://github.com/harababurel/faro/releases/download/v$pkgver/$_pkgname-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('673323eba06ad303d122c03f915ec9f58d04335610bef2e60dcedaccd974bd0f')
sha256sums_aarch64=('e1afbe19ddd3b11d65b04386fd4c17acc6b144cac2ce182d3356b9714b34e5a1')

package() {
  local _dir="$_pkgname-$CARCH-unknown-linux-gnu"
  install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/$_dir/$_pkgname"
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" "$srcdir/$_dir/README.md"
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" "$srcdir/$_dir/THIRD_PARTY_NOTICES.md"
}
