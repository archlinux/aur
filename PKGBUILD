# Maintainer: shurizzle
# Prebuilt static musl binaries from the `vX.Y.Z` GitHub releases (.github/workflows/release.yml).
pkgname=hum-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='Terminal Spotify client'
arch=('x86_64' 'aarch64')
url='https://github.com/shurizzle/hum'
license=('MIT')
depends=('spotify-soloist')
options=('!debug' '!strip')
source=('LICENSE')
source_x86_64=("hum-x86_64-$pkgver.tar.gz::$url/releases/download/v$pkgver/hum-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("hum-aarch64-$pkgver.tar.gz::$url/releases/download/v$pkgver/hum-aarch64-unknown-linux-musl.tar.gz")
sha256sums=('2c3b4fdd3a8cc2935b26589628de020fa1a701455797080901b8191bd6ae0eb2')
sha256sums_x86_64=('e36d954960aa2074db58438d779672da999d94d29e926e4ba6f287af3d24fa0e')
sha256sums_aarch64=('25d536bba76e5a992bd499e6d06f12df68502a55d763812a453b60c34c70a286')

package() {
  install -Dm755 hum "$pkgdir/usr/bin/hum"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  "$pkgdir/usr/bin/hum" completions bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/hum"
  "$pkgdir/usr/bin/hum" completions zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_hum"
  "$pkgdir/usr/bin/hum" completions fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/hum.fish"
}
