# Maintainer: hotline1337 <denuvo at tuta dot io>

pkgname=nym-vpnd-beta-bin
_dlver=2026.16.0-beta.2
pkgver=2026.16.0
pkgrel=2
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
  "nym-vpn.conf"
)
source_aarch64=(
  "nym-vpn-core-bin-aarch64.tar.gz::${url}/releases/download/${_release_tag}/nym-vpn-core-v${_dlver}_linux_aarch64.tar.gz"
  "nym-vpnd.service"
  "nym-vpn.conf"
)
b2sums_x86_64=('9ec521ae9467dcd67d2697705bee3b789aeba7f8de6c74c7ad6486bef9082f26eb6c60eea1a793bda3189a43a58ffb87f12f8024d4208f7063fa2cdddd2ece10'
               'ce22870bc2c4969c77c067047cc5fec0cc32680983071791ca58f0d197c7d82a7c9c2ee0275e80b5c85e912d70144532bc8ff7d82d458ac286d5eaed9f777414'
               'b10f63aa6bfce86012bc46176025a847c2877cd8728652ba7d4dcaeba67d71b6eb35212281da43e117c5c11cae3499f8425c1e486a358047b7340bf613a4b14a')
b2sums_aarch64=('7474af062cea30b25f4b4d99829af9232ddccb5d8ccab26600de8ea72fa4a823b41495bab3508a9359066e50f72af5aca645aa462b0ffed98026d65127930b54'
                'ce22870bc2c4969c77c067047cc5fec0cc32680983071791ca58f0d197c7d82a7c9c2ee0275e80b5c85e912d70144532bc8ff7d82d458ac286d5eaed9f777414'
                'b10f63aa6bfce86012bc46176025a847c2877cd8728652ba7d4dcaeba67d71b6eb35212281da43e117c5c11cae3499f8425c1e486a358047b7340bf613a4b14a')

package() {
  local _srcdir="nym-vpn-core-v${_dlver}_linux_${CARCH}"

  install -Dm755 "${_srcdir}/nym-vpnd" "${pkgdir}/usr/bin/nym-vpnd"
  install -Dm4755 "${_srcdir}/nym-exclude" "${pkgdir}/usr/bin/nym-exclude"
  install -Dm755 "${_srcdir}/nym-socks5-proxy" "${pkgdir}/usr/bin/nym-socks5-proxy"

  install -Dm644 nym-vpnd.service "${pkgdir}/usr/lib/systemd/system/nym-vpnd.service"
  install -Dm644 nym-vpn.conf "${pkgdir}/usr/lib/sysusers.d/nym-vpn.conf"
}
