# Maintainer: David Borzek <mail@davidborzek.de>
# Package is `ringo-phone-bin` (matching the crates.io crate `ringo-phone`); the
# bare `ringo` name is taken on the AUR by an unrelated project. The binary it
# installs is still `ringo`.
pkgname=ringo-phone-bin
pkgver=0.16.1
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
source_x86_64=("ringo-$pkgver-x86_64.tar.gz::https://github.com/davidborzek/ringo/releases/download/ringo-phone-v0.16.1/ringo-0.16.1-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("ringo-$pkgver-aarch64.tar.gz::https://github.com/davidborzek/ringo/releases/download/ringo-phone-v0.16.1/ringo-0.16.1-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('c1e9b932131a36a1f4d357f2b606055647b091ff3126ab6cb8f12ad2cb305d88')
sha256sums_aarch64=('cfa88874acc75d6ce8b10e60f25fca5417dff8dab09f9c0d3c7c935f82cf62d7')

package() {
  case "$CARCH" in
    x86_64) _target="x86_64-unknown-linux-gnu" ;;
    aarch64) _target="aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "$srcdir/ringo-$pkgver-$_target/ringo" "$pkgdir/usr/bin/ringo"
}
