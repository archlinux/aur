# Maintainer: f02xygen <i@f02xy.ru>
pkgname=xrat-bin
pkgver=0.23.1
pkgrel=1
pkgdesc="Rust CLI/TUI proxy manager for Xray-core, V2Ray-core, and sing-box"
arch=('x86_64' 'aarch64')
url="https://github.com/mhyrzt/xrat"
install=$pkgname.install
license=('Apache-2.0' 'MIT')
depends=('glibc' 'gcc-libs')
optdepends=(
  'xray: Xray core executable for running proxy sessions'
  'sing-box: sing-box core executable'
  'v2ray: V2Ray core executable'
)
provides=('xrat')
conflicts=('xrat')
options=('!strip')

source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/mhyrzt/xrat/releases/download/v${pkgver}/xrat-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/mhyrzt/xrat/releases/download/v${pkgver}/xrat-v${pkgver}-aarch64-unknown-linux-musl.tar.gz")

sha256sums_x86_64=('614008d3864f0989c9939fe6990fb9f96e9c17b3be94c0029eb54b54d44c39b1')
sha256sums_aarch64=('a59379c7bbdf98d52d1d9d39ec9710c6ae8152b3b3dbbffaafea1e7262fb02db')

package() {
  cd "$srcdir"

  install -Dm755 xrat -t "$pkgdir/usr/bin/"

  if [ -d "completions" ]; then
    install -Dm644 completions/xrat.bash "$pkgdir/usr/share/bash-completion/completions/xrat"
    install -Dm644 completions/xrat.zsh "$pkgdir/usr/share/zsh/site-functions/_xrat"
    install -Dm644 completions/xrat.fish "$pkgdir/usr/share/fish/vendor_completions.d/xrat.fish"
  fi

  if [ -f "LICENSE" ]; then
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
}
