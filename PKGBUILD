# Maintainer: hotline1337 <denuvo at tuta dot io>

pkgname=nym-vpnd-beta-bin
pkgver=2026.12.1
pkgrel=4
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
b2sums_x86_64=('a9facd7363762cafbc2ea33ea785ef6a7029c1cf4ddd4bcad1056fade20411a0b307cd6f9c3d08863cd34e6f4707ccfe48e975b128be10d630e264eb05e2bdf1'
               'ce22870bc2c4969c77c067047cc5fec0cc32680983071791ca58f0d197c7d82a7c9c2ee0275e80b5c85e912d70144532bc8ff7d82d458ac286d5eaed9f777414')
b2sums_aarch64=('a7ce1b32a2d6ee78e12ca4241227ac99542daa26dcd81292da9901b55bea52e666cb8c20e956fcaebf762c69d60aed503d39763dbab8bd82ed571536c3c3a090'
                'ce22870bc2c4969c77c067047cc5fec0cc32680983071791ca58f0d197c7d82a7c9c2ee0275e80b5c85e912d70144532bc8ff7d82d458ac286d5eaed9f777414')

package() {
  local _srcdir="nym-vpn-core-v${pkgver}-beta.${pkgrel}_linux_${CARCH}"

  install -Dm755 "${_srcdir}/nym-vpnd" "${pkgdir}/usr/bin/nym-vpnd"
  install -Dm4755 "${_srcdir}/nym-exclude" "${pkgdir}/usr/bin/nym-exclude"
  install -Dm755 "${_srcdir}/nym-socks5-proxy" "${pkgdir}/usr/bin/nym-socks5-proxy"

  install -Dm644 nym-vpnd.service "${pkgdir}/usr/lib/systemd/system/nym-vpnd.service"
}
