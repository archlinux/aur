# Maintainer: hotline1337 <denuvo at tuta dot io>

pkgname=nym-vpnd-beta-bin
pkgver=2026.12.1
pkgrel=1
_release_tag="nym-vpn-v${pkgver}-beta.${pkgrel}"
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
source_x86_64=(
  "nym-vpn-core-bin-x86_64.tar.gz::${url}/releases/download/${_release_tag}/nym-vpn-core-v${pkgver}-beta.${pkgrel}_linux_x86_64.tar.gz"
  "nym-vpnd.service"
)
source_aarch64=(
  "nym-vpn-core-bin-aarch64.tar.gz::${url}/releases/download/${_release_tag}/nym-vpn-core-v${pkgver}-beta.${pkgrel}_linux_aarch64.tar.gz"
  "nym-vpnd.service"
)
b2sums_x86_64=('ac03276444e6620d239ced7a48fe084e061e560dce880a316e486cb38270bab91de68cc798f82440b0f243e2d10de822ebd384ca78381db1c014e313b03671d0'
               'ce22870bc2c4969c77c067047cc5fec0cc32680983071791ca58f0d197c7d82a7c9c2ee0275e80b5c85e912d70144532bc8ff7d82d458ac286d5eaed9f777414')
b2sums_aarch64=('e3741299c7a08d94bbaa97aa5127dfdd12bcd4b4a4168543e324c4292f8a0eb5374566e6862882d2b004f1dd070e4af77faa72ed49c69ca327bbfa403d6d365e'
                'ce22870bc2c4969c77c067047cc5fec0cc32680983071791ca58f0d197c7d82a7c9c2ee0275e80b5c85e912d70144532bc8ff7d82d458ac286d5eaed9f777414')

package() {
  local _srcdir="nym-vpn-core-v${pkgver}-beta.${pkgrel}_linux_${CARCH}"

  install -Dm755 "${_srcdir}/nym-vpnd" "${pkgdir}/usr/bin/nym-vpnd"
  install -Dm4755 "${_srcdir}/nym-exclude" "${pkgdir}/usr/bin/nym-exclude"
  install -Dm755 "${_srcdir}/nym-socks5-proxy" "${pkgdir}/usr/bin/nym-socks5-proxy"

  install -Dm644 nym-vpnd.service "${pkgdir}/usr/lib/systemd/system/nym-vpnd.service"
}
