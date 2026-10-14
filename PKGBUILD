# Maintainer: Sergiu Puscas <srg.pscs@gmail.com>

pkgname=faro-bin
_pkgname=faro
pkgver=0.1.1
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
  'whisper.cpp: transcribe voice notes locally'
  'libsecret: read the remote transcription API key from the keyring'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
# The dist archives hold already-stripped release binaries.
options=('!strip' '!debug')
source_x86_64=("$_pkgname-x86_64-unknown-linux-gnu-$pkgver.tar.xz::https://github.com/harababurel/faro/releases/download/v$pkgver/$_pkgname-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("$_pkgname-aarch64-unknown-linux-gnu-$pkgver.tar.xz::https://github.com/harababurel/faro/releases/download/v$pkgver/$_pkgname-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('5db21c075d33882173e61b10f15e8c87cc36640b2e179c3ae0fc0090b8e18e2b')
sha256sums_aarch64=('3d6e62a078ce0a53ef74f2f5f4d2766a96a1de6827577468a0b1164aac4c538f')

package() {
  local _dir="$_pkgname-$CARCH-unknown-linux-gnu"
  install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/$_dir/$_pkgname"
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" "$srcdir/$_dir/README.md"
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" "$srcdir/$_dir/THIRD_PARTY_NOTICES.md"
}
