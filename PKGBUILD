# Maintainer: hotline1337 <denuvo at tuta dot io>

pkgname=nym-vpnd-beta-bin
_dlver=2026.12.4-beta.4
pkgver=2026.12.4
pkgrel=4
_release_tag="nym-vpn-v${_dlver}"
pkgdesc="NymVPN daemon (Beta)"
arch=("x86_64" "aarch64")
url="https://github.com/nymtech/nym-vpn-client"
license=("GPL-3.0-only")
depends=(
  "dbus"
  "gcc-libs"
  "glibc"
  "libmnl"
  "libnftnl"
  "polkit"
)
provides=("nym-vpnd" "nym-exclude" "nym-socks5-proxy")
conflicts=("nym-vpnd")
options=("!debug")
install="${pkgname}.install"
source_x86_64=(
  "nym-vpn-core-bin-x86_64.tar.gz::${url}/releases/download/${_release_tag}/nym-vpn-core-v${_dlver}_linux_x86_64.tar.gz"
  "nym-vpnd.service"
)
source_aarch64=(
  "nym-vpn-core-bin-aarch64.tar.gz::${url}/releases/download/${_release_tag}/nym-vpn-core-v${_dlver}_linux_aarch64.tar.gz"
  "nym-vpnd.service"
)
b2sums_x86_64=('9bc2a92189e6881d9446625d55832169136a9f58b8c7ec13c94ae8e42266c8e3acecd465b1c0d3a693cb2251d7ec72f92cc96cd0cef723d224c8de56c9947306'
               'ce22870bc2c4969c77c067047cc5fec0cc32680983071791ca58f0d197c7d82a7c9c2ee0275e80b5c85e912d70144532bc8ff7d82d458ac286d5eaed9f777414')
b2sums_aarch64=('288fbaf48cfb4cad38efc0845008cdf46a46436265e39768df77b2ae6462911d818494bf82762e3c3e03bbd43f62b47fe57180c3182be3729d587390edc59017'
                'ce22870bc2c4969c77c067047cc5fec0cc32680983071791ca58f0d197c7d82a7c9c2ee0275e80b5c85e912d70144532bc8ff7d82d458ac286d5eaed9f777414')

package() {
  local _srcdir="nym-vpn-core-v${_dlver}_linux_${CARCH}"

  install -Dm755 "${_srcdir}/nym-vpnd" "${pkgdir}/usr/bin/nym-vpnd"
  install -Dm4755 "${_srcdir}/nym-exclude" "${pkgdir}/usr/bin/nym-exclude"
  install -Dm755 "${_srcdir}/nym-socks5-proxy" "${pkgdir}/usr/bin/nym-socks5-proxy"

  install -Dm644 nym-vpnd.service "${pkgdir}/usr/lib/systemd/system/nym-vpnd.service"
}
