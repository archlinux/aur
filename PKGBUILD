# Maintainer: Sergiu Puscas <srg.pscs@gmail.com>

pkgname=faro-bin
_pkgname=faro
pkgver=0.1.6
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
sha256sums_x86_64=('43dd29e07f0ba1356b4f73f560014b9ad4c953fb50dc5f23b1133614d22fe832')
sha256sums_aarch64=('5c33b43d6546efae1f729c253521128ff6a2241b6867e17c6ed27bd319dd4278')

package() {
  local _dir="$_pkgname-$CARCH-unknown-linux-gnu"
  install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/$_dir/$_pkgname"
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" "$srcdir/$_dir/README.md"
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" "$srcdir/$_dir/THIRD_PARTY_NOTICES.md"
}
