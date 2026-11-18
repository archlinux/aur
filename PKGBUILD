# Maintainer: Nym <ops@nymte.ch>
# Maintainer: Andrej Mihajlov <andrej@nymtech.net>

pkgname=nym-vpnc-bin
pkgver=2026.16.0
pkgrel=1
pkgdesc='NymVPN command-line client'
arch=('x86_64' 'aarch64')
url='https://github.com/nymtech/nym-vpn-client'
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs' 'polkit' 'nym-vpnd')
makedepends=()
provides=('nym-vpnc')
conflicts=('nym-vpnc')
options=(!debug)
source_x86_64=("$url/releases/download/nym-vpn-v2026.16.0/nym-vpn-core-v2026.16.0_linux_x86_64.tar.gz")
source_aarch64=("$url/releases/download/nym-vpn-v2026.16.0/nym-vpn-core-v2026.16.0_linux_aarch64.tar.gz")
sha256sums_x86_64=(9cf6c288e5b7dd2d6437d3c3d2a953caa320da8a9c606d34a4ab8ecf96d6c7ce)
sha256sums_aarch64=(d43a28ae1dd1ed896dc09303d4d0ae33c23817e8cc05cb72bf23ee927e15b2ce)

build() {
  local bin="nym-vpn-core-v2026.16.0_linux_${CARCH}/nym-vpnc"
  chmod +x "$bin"
  mkdir -p completions
  "$bin" completions bash > completions/nym-vpnc.bash
  "$bin" completions zsh > completions/_nym-vpnc
  "$bin" completions fish > completions/nym-vpnc.fish
}

package() {
  install -Dm755 "nym-vpn-core-v2026.16.0_linux_${CARCH}/nym-vpnc" "$pkgdir/usr/bin/nym-vpnc"
  install -Dm644 completions/nym-vpnc.bash "$pkgdir/usr/share/bash-completion/completions/nym-vpnc"
  install -Dm644 completions/_nym-vpnc "$pkgdir/usr/share/zsh/site-functions/_nym-vpnc"
  install -Dm644 completions/nym-vpnc.fish "$pkgdir/usr/share/fish/vendor_completions.d/nym-vpnc.fish"
}
