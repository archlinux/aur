# Maintainer: David Borzek <mail@davidborzek.de>
# Package is `ringo-phone-bin` (matching the crates.io crate `ringo-phone`); the
# bare `ringo` name is taken on the AUR by an unrelated project. The binary it
# installs is still `ringo`.
pkgname=ringo-phone-bin
pkgver=0.15.0
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
source_x86_64=("ringo-$pkgver-x86_64.tar.gz::https://github.com/davidborzek/ringo/releases/download/ringo-phone-v0.15.0/ringo-0.15.0-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("ringo-$pkgver-aarch64.tar.gz::https://github.com/davidborzek/ringo/releases/download/ringo-phone-v0.15.0/ringo-0.15.0-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('8da596c807b5f914785d7367a8b6efedadec108f42c17c97aa5b6be816c78692')
sha256sums_aarch64=('4226c753a01b8144233aa4b35bbd442d9ff59d05b06b72b65240566cb12b7c67')

package() {
  case "$CARCH" in
    x86_64) _target="x86_64-unknown-linux-gnu" ;;
    aarch64) _target="aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "$srcdir/ringo-$pkgver-$_target/ringo" "$pkgdir/usr/bin/ringo"
}
