# Maintainer: andrizan <me@andrizan.com>
#
# Source of truth: pkg/aur/PKGBUILD in https://github.com/andrizan/subx.
# release.yml sets pkgver and the checksums from every v* tag and pushes the
# result to the AUR, so edit it in the repo, not on the AUR.

pkgname=subx-bin
_pkgname=subx
pkgver=1.3.7
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
sha256sums_x86_64=('87c364c4d4a2cbe977c10db8a55fbbb97739c95190755ab7e5ca60f8ccaf26ac')
sha256sums_aarch64=('4507a340adbb28098c8afba27cdfcc54f65786b44a20388a55d3acc3d1a6d73c')

package() {
  cd "$_pkgname-$pkgver-$CARCH-unknown-linux-musl"
  install -Dm755 subx "$pkgdir/usr/bin/subx"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md subx.toml subx.local.toml.example -t "$pkgdir/usr/share/doc/$pkgname/"
}
