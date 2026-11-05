# Maintainer: hotline1337 <denuvo at tuta dot io>

pkgname=nym-vpnd-beta-bin
_dlver=2026.15.0-beta.2
pkgver=2026.15.0
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
)
source_aarch64=(
  "nym-vpn-core-bin-aarch64.tar.gz::${url}/releases/download/${_release_tag}/nym-vpn-core-v${_dlver}_linux_aarch64.tar.gz"
  "nym-vpnd.service"
)
b2sums_x86_64=('dff8211ea11aad6073306e009bcbe63a4f65769704bfeeeac80389cd317c69317121a2e9194cd9ce1ee0ddae810703b0c195c8181e4272a65464615d4a333637'
               'ce22870bc2c4969c77c067047cc5fec0cc32680983071791ca58f0d197c7d82a7c9c2ee0275e80b5c85e912d70144532bc8ff7d82d458ac286d5eaed9f777414')
b2sums_aarch64=('64f50874cc9a8999195fbc17b03d588804a06fdfb003887aa160efb353433dcdd658c256b4b975bb6da8d4a84e3d963b46c8da48995db13f941a148d34d29221'
                'ce22870bc2c4969c77c067047cc5fec0cc32680983071791ca58f0d197c7d82a7c9c2ee0275e80b5c85e912d70144532bc8ff7d82d458ac286d5eaed9f777414')

package() {
  local _srcdir="nym-vpn-core-v${_dlver}_linux_${CARCH}"

  install -Dm755 "${_srcdir}/nym-vpnd" "${pkgdir}/usr/bin/nym-vpnd"
  install -Dm4755 "${_srcdir}/nym-exclude" "${pkgdir}/usr/bin/nym-exclude"
  install -Dm755 "${_srcdir}/nym-socks5-proxy" "${pkgdir}/usr/bin/nym-socks5-proxy"

  install -Dm644 nym-vpnd.service "${pkgdir}/usr/lib/systemd/system/nym-vpnd.service"
}
