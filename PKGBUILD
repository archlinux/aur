# Maintainer: Sergiu Puscas <srg.pscs@gmail.com>

pkgname=faro-bin
_pkgname=faro
pkgver=0.1.8
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
sha256sums_x86_64=('6ccdb342862868e6f50ab8c60365393d2aa2c14b7c0ec0d513f55f9544d1d4c1')
sha256sums_aarch64=('165932cbfa6755dcb5f12b20ff89d264bfe567e9eccce43f13b22e1161d4ba86')

package() {
  local _dir="$_pkgname-$CARCH-unknown-linux-gnu"
  install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/$_dir/$_pkgname"
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" "$srcdir/$_dir/README.md"
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" "$srcdir/$_dir/THIRD_PARTY_NOTICES.md"
}
