# Maintainer: andrizan <me@andrizan.com>
#
# Source of truth: pkg/aur/PKGBUILD in https://github.com/andrizan/subx.
# release.yml sets pkgver and the checksums from every v* tag and pushes the
# result to the AUR, so edit it in the repo, not on the AUR.

pkgname=subx-bin
_pkgname=subx
pkgver=1.3.5
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
sha256sums_x86_64=('e92f7f21a2d0a5f801f9625376061874d992936e166d5fcff37df2db5f8883ab')
sha256sums_aarch64=('ad095c1f3affd993ad122a32f604f2e20418783000cb5d8f1c3affad59eade3c')

package() {
  cd "$_pkgname-$pkgver-$CARCH-unknown-linux-musl"
  install -Dm755 subx "$pkgdir/usr/bin/subx"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md subx.toml subx.local.toml.example -t "$pkgdir/usr/share/doc/$pkgname/"
}
