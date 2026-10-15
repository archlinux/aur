# Maintainer: David Borzek <mail@davidborzek.de>
pkgname=ringo-mcp-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="MCP server over stdio exposing ringo SIP agents for LLM-driven telephony"
arch=('x86_64' 'aarch64')
url="https://github.com/davidborzek/ringo"
license=('MIT')
# baresip/libre/OpenSSL are statically linked into the binary; opus and spandsp
# are linked dynamically (same as the Homebrew formula).
depends=('opus' 'spandsp')
provides=('ringo-mcp')
conflicts=('ringo-mcp')
source_x86_64=("ringo-mcp-$pkgver-x86_64.tar.gz::https://github.com/davidborzek/ringo/releases/download/ringo-mcp-v0.1.0/ringo-mcp-0.1.0-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("ringo-mcp-$pkgver-aarch64.tar.gz::https://github.com/davidborzek/ringo/releases/download/ringo-mcp-v0.1.0/ringo-mcp-0.1.0-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('ce885bf74b4e8d064cf9b2a3ad3d8320194c732f444843acee1d6254f5b7f51c')
sha256sums_aarch64=('6d07a1c5efa16e16c4f8cab8aae91cb34d00072cdcc8bedf98119e71093e8473')

package() {
  case "$CARCH" in
    x86_64) _target="x86_64-unknown-linux-gnu" ;;
    aarch64) _target="aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "$srcdir/ringo-mcp-$pkgver-$_target/ringo-mcp" "$pkgdir/usr/bin/ringo-mcp"
}
