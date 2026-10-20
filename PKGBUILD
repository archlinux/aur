# Maintainer: f02xygen <i@f02xy.ru>
pkgname=xrat-bin
pkgver=0.31.2
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

sha256sums_x86_64=('15c37afa75f22e4f7142a910f4deaa28381b238cc1a8906d515b6de5d7d70ddd')
sha256sums_aarch64=('64086fce60ea991a5bbeb4212436801a81425f9c7762fac05c885af97a232d54')

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
