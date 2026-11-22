# Maintainer: shurizzle
# Prebuilt static musl binaries from the `vX.Y.Z` GitHub releases (.github/workflows/release.yml).
pkgname=hum-bin
pkgver=0.1.3
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
sha256sums_x86_64=('343064c8e4119d12dc8f920abb7c8d5ef906960ec70f45fbca64e0f984b4ab99')
sha256sums_aarch64=('a1b2513c823a8299eec702a6b92a4182f9e08d434ae791c389b68fd460fae78c')

package() {
  install -Dm755 hum "$pkgdir/usr/bin/hum"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  "$pkgdir/usr/bin/hum" completions bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/hum"
  "$pkgdir/usr/bin/hum" completions zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_hum"
  "$pkgdir/usr/bin/hum" completions fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/hum.fish"
}
