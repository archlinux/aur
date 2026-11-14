# Maintainer: hotline1337 <denuvo at tuta dot io>

pkgname=nym-vpnd-beta-bin
_dlver=2026.16.0-beta.1
pkgver=2026.16.0
pkgrel=1
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
b2sums_x86_64=('d1b1fc4259bd2d95f05f88e69e92f0135bea3a7496a4c832818e1f4eb786edffaefd6bb26d2cd93b0a66efa12ec3cfc467d9c6322c6024e37295d8641bdda7d1'
               'ce22870bc2c4969c77c067047cc5fec0cc32680983071791ca58f0d197c7d82a7c9c2ee0275e80b5c85e912d70144532bc8ff7d82d458ac286d5eaed9f777414'
               'b10f63aa6bfce86012bc46176025a847c2877cd8728652ba7d4dcaeba67d71b6eb35212281da43e117c5c11cae3499f8425c1e486a358047b7340bf613a4b14a')
b2sums_aarch64=('ac96d22ca8dc83a6fa9f282cb379e16e0dba308c4add5c0bace3369cfe352d7801438bed47322b8e78f67f88d58806d54d555db4c22dfa20b548fdf89cffb0ae'
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
