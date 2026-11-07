# Maintainer: andrizan <me@andrizan.com>
#
# Source of truth: pkg/aur/PKGBUILD in https://github.com/andrizan/subx.
# release.yml sets pkgver and the checksums from every v* tag and pushes the
# result to the AUR, so edit it in the repo, not on the AUR.

pkgname=subx-bin
_pkgname=subx
pkgver=1.3.4
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
sha256sums_x86_64=('fa195448c911702f01f9c7d2e896d480e22d5f5834cba4f26555e1d9267b1eae')
sha256sums_aarch64=('424c8d37186acc2143348cbc6bba572a40de2efec13ac472f0cb08029e00501e')

package() {
  cd "$_pkgname-$pkgver-$CARCH-unknown-linux-musl"
  install -Dm755 subx "$pkgdir/usr/bin/subx"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md subx.toml subx.local.toml.example -t "$pkgdir/usr/share/doc/$pkgname/"
}
