# Maintainer: nabbisen
#
# Filled from this repository by `packaging/aur/render.sh` -- see `../stikk/PKGBUILD.in` for why
# no number here is written by hand.
#
# **The release's own static musl archives**, for the two architectures stikk publishes.
pkgname=stikk-bin
pkgver=0.20.0
pkgrel=1
pkgdesc='A terminal UI for the prikk version control system (prebuilt, statically linked)'
arch=('x86_64' 'aarch64')
url='https://github.com/prikk-vcs/stikk'
license=('Apache-2.0')
# See `../stikk/PKGBUILD.in` on the versioned prikk dependency. Nothing links here -- the archive
# is statically linked -- so there is no library dependency to declare.
depends=('prikk>=0.28')
provides=("stikk=$pkgver")
conflicts=('stikk')
# **`!strip` is the point** (RFC 051 F2): stripping would rewrite the binary, and then
# `gh attestation verify` on the release archive would no longer speak for what pacman installed.
# Measured: with these options the installed `/usr/bin/stikk` is byte-identical to the archive's.
options=('!strip' '!debug')
source_x86_64=("https://github.com/prikk-vcs/stikk/releases/download/$pkgver/stikk-$pkgver-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("https://github.com/prikk-vcs/stikk/releases/download/$pkgver/stikk-$pkgver-aarch64-unknown-linux-musl.tar.gz")
# From the release's own `.sha256` assets for this version.
sha256sums_x86_64=('2a9967cfce3c29e2aa4d3604c92f69f6839932ea35bfecca6d9badfc6553340c')
sha256sums_aarch64=('a3439314c1fccb95d3e0a74a8a9043c393046feccaf3fdafb3003d18c3d0e505')

package() {
  cd "stikk-$pkgver-$CARCH-unknown-linux-musl"
  install -Dm755 stikk "$pkgdir/usr/bin/stikk"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
