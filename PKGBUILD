# Maintainer: Filip / hotline1337 <denuvo at tuta dot io>

pkgname=nym-vpnd-nightly-bin
pkgver=2026.13.0
pkgrel=20260813
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
b2sums_x86_64=('40b8a9e3c26d39499fe9220fc24aba286e83989d0e950bc4d00ea50b4799fdab92626be3514a52492b9388ebb37caaf2c3e86f149be1e4f47e490b1649c124d2'
               'ce22870bc2c4969c77c067047cc5fec0cc32680983071791ca58f0d197c7d82a7c9c2ee0275e80b5c85e912d70144532bc8ff7d82d458ac286d5eaed9f777414')
b2sums_aarch64=('6fd30d77702a5a59150ebbc92420589d11e1ee3af02ba112b3a102196321c13847f776a55c330532afa5a70f906380e0ff36756e85f33cca16ec96d6bfad1d8c'
                'ce22870bc2c4969c77c067047cc5fec0cc32680983071791ca58f0d197c7d82a7c9c2ee0275e80b5c85e912d70144532bc8ff7d82d458ac286d5eaed9f777414')

package() {
  local _srcdir="nym-vpn-core-v${pkgver}-nightly.${pkgrel}_linux_${CARCH}"

  install -Dm755 "${_srcdir}/nym-vpnd" "${pkgdir}/usr/bin/nym-vpnd"
  install -Dm4755 "${_srcdir}/nym-exclude" "${pkgdir}/usr/bin/nym-exclude"
  install -Dm755 "${_srcdir}/nym-socks5-proxy" "${pkgdir}/usr/bin/nym-socks5-proxy"

  install -Dm644 nym-vpnd.service "${pkgdir}/usr/lib/systemd/system/nym-vpnd.service"
}
