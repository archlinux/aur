# Maintainer: Filip / hotline1337 <denuvo at tuta dot io>

pkgname=nym-vpnd-nightly-bin
pkgver=2026.13.0
pkgrel=20260812
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
b2sums_x86_64=('c8592df027f64c66accb30f47829c55a55bb2f0880d751bff7df872f96e04e1f99683d2d89eeebe63c08a0d6ec3abd9979ca2e364f323e98000581ad679834cd'
               'ce22870bc2c4969c77c067047cc5fec0cc32680983071791ca58f0d197c7d82a7c9c2ee0275e80b5c85e912d70144532bc8ff7d82d458ac286d5eaed9f777414')
b2sums_aarch64=('0031497e1c868e89057b4394dc5a1105c5babf81ce488cd65543a92fc5bdc9104c613ef84b99a36a132bf03feb5e9a6914a240fa94a6d753ee7e34e7a31bae3f'
                'ce22870bc2c4969c77c067047cc5fec0cc32680983071791ca58f0d197c7d82a7c9c2ee0275e80b5c85e912d70144532bc8ff7d82d458ac286d5eaed9f777414')

package() {
  local _srcdir="nym-vpn-core-v${pkgver}-nightly.${pkgrel}_linux_${CARCH}"

  install -Dm755 "${_srcdir}/nym-vpnd" "${pkgdir}/usr/bin/nym-vpnd"
  install -Dm4755 "${_srcdir}/nym-exclude" "${pkgdir}/usr/bin/nym-exclude"
  install -Dm755 "${_srcdir}/nym-socks5-proxy" "${pkgdir}/usr/bin/nym-socks5-proxy"

  install -Dm644 nym-vpnd.service "${pkgdir}/usr/lib/systemd/system/nym-vpnd.service"
}
