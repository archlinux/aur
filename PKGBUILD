# Maintainer: Filip / hotline1337 <denuvo at tuta dot io>

pkgname=nym-vpnd-nightly-bin
pkgver=2026.13.0
pkgrel=20260810
_release_tag="nym-vpn-v${pkgver}-nightly.${pkgrel}"
pkgdesc="NymVPN daemon (Nightly)"
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
source_x86_64=("${url}/releases/download/${_release_tag}/nym-vpn-core-v${pkgver}-nightly.${pkgrel}_linux_x86_64.tar.gz"
               "nym-vpnd.service")
source_aarch64=("${url}/releases/download/${_release_tag}/nym-vpn-core-v${pkgver}-nightly.${pkgrel}_linux_aarch64.tar.gz"
                "nym-vpnd.service")
b2sums_x86_64=('131e713f554750130bbf5c7eceb259fbbd8c871770e858db616e8ec87c8e9a9dcd95fc20f1774886f6daa2da5250ebb6e3b108bcd2f8ba64c2662156f9534085'
               'ce22870bc2c4969c77c067047cc5fec0cc32680983071791ca58f0d197c7d82a7c9c2ee0275e80b5c85e912d70144532bc8ff7d82d458ac286d5eaed9f777414')
b2sums_aarch64=('54cd2f83dd8d0f51ff6d6575b52281e6afead56af46e77a5ca87e6a8332df7e4f0dd78d0267580538a1d441a0df19babf0589c390bf1ab7b874cdc6e8272784a'
                'ce22870bc2c4969c77c067047cc5fec0cc32680983071791ca58f0d197c7d82a7c9c2ee0275e80b5c85e912d70144532bc8ff7d82d458ac286d5eaed9f777414')

package() {
  local _srcdir="nym-vpn-core-v${pkgver}-nightly.${pkgrel}_linux_${CARCH}"

  install -Dm755 "${_srcdir}/nym-vpnd" "${pkgdir}/usr/bin/nym-vpnd"
  install -Dm4755 "${_srcdir}/nym-exclude" "${pkgdir}/usr/bin/nym-exclude"
  install -Dm755 "${_srcdir}/nym-socks5-proxy" "${pkgdir}/usr/bin/nym-socks5-proxy"

  install -Dm644 nym-vpnd.service "${pkgdir}/usr/lib/systemd/system/nym-vpnd.service"
}
