# Maintainer: andrizan <me@andrizan.com>
#
# Source of truth: pkg/aur/PKGBUILD in https://github.com/andrizan/subx.
# release.yml sets pkgver and the checksums from every v* tag and pushes the
# result to the AUR, so edit it in the repo, not on the AUR.

pkgname=subx-bin
_pkgname=subx
pkgver=1.3.6
pkgrel=1
pkgdesc='All-in-one fansub toolkit: extract/clean/shift/mux/convert/translate subs (prebuilt static binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/andrizan/subx'
license=('Unlicense')
depends=('ffmpeg')
optdepends=(
  'mkvtoolnix-cli: sync on a video, extract --fonts/--chapters, native encode'
  'yt-dlp: fetch subtitles'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip' '!debug')
source_x86_64=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64-unknown-linux-musl.tar.xz")
source_aarch64=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-aarch64-unknown-linux-musl.tar.xz")
sha256sums_x86_64=('98746ad4ec4c2aa91c46278baf48f41d3d38129a72685e2721112078db85bb54')
sha256sums_aarch64=('f2f8fe922ba7aa52d81473ef02af691cbf67fcf73b0c8ea0235460482b10a93a')

package() {
  cd "$_pkgname-$pkgver-$CARCH-unknown-linux-musl"
  install -Dm755 subx "$pkgdir/usr/bin/subx"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md subx.toml subx.local.toml.example -t "$pkgdir/usr/share/doc/$pkgname/"
}
