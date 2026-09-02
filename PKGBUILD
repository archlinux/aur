# Maintainer: David Borzek <mail@davidborzek.de>
# Package is `ringo-phone-bin` (matching the crates.io crate `ringo-phone`); the
# bare `ringo` name is taken on the AUR by an unrelated project. The binary it
# installs is still `ringo`.
pkgname=ringo-phone-bin
pkgver=0.16.0
pkgrel=1
pkgdesc="A terminal SIP softphone built on baresip"
arch=('x86_64' 'aarch64')
url="https://github.com/davidborzek/ringo"
license=('MIT')
# baresip/libre/OpenSSL are statically linked into the binary; opus and spandsp
# are linked dynamically (same as the Homebrew formula).
depends=('opus' 'spandsp')
provides=('ringo-phone')
conflicts=('ringo-phone')
source_x86_64=("ringo-$pkgver-x86_64.tar.gz::https://github.com/davidborzek/ringo/releases/download/ringo-phone-v0.16.0/ringo-0.16.0-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("ringo-$pkgver-aarch64.tar.gz::https://github.com/davidborzek/ringo/releases/download/ringo-phone-v0.16.0/ringo-0.16.0-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('b8d99144b22e446e246256bc0f3a44b4f6c3d27f724c68996e04b40f29910152')
sha256sums_aarch64=('d646566d3a92d282d3c157cad536c4848f8b147f68049ea7545242c4e8ad3da8')

package() {
  case "$CARCH" in
    x86_64) _target="x86_64-unknown-linux-gnu" ;;
    aarch64) _target="aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "$srcdir/ringo-$pkgver-$_target/ringo" "$pkgdir/usr/bin/ringo"
}
