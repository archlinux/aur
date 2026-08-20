# Maintainer: hotline1337 <denuvo at tuta dot io>

pkgname=nym-vpnd-beta-bin
pkgver=2026.12.1
pkgrel=2
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
b2sums_x86_64=('2549f24ec569b2746d1d371a2100465c9f678403e13c95641b1130927e119b97c7067bcdfb3aa22c8f7b9367cbdb086d335ee02855ee66e777f00c231f0e98cd'
               'ce22870bc2c4969c77c067047cc5fec0cc32680983071791ca58f0d197c7d82a7c9c2ee0275e80b5c85e912d70144532bc8ff7d82d458ac286d5eaed9f777414')
b2sums_aarch64=('19bc5006c9c94f3116326135cc30c335fc1ce378a1be6a24f8ae55c3333cdc76de2b5800f9406a62661ef54791b7e3b83d07e462551f575f4892538ad3347d20'
                'ce22870bc2c4969c77c067047cc5fec0cc32680983071791ca58f0d197c7d82a7c9c2ee0275e80b5c85e912d70144532bc8ff7d82d458ac286d5eaed9f777414')

package() {
  local _srcdir="nym-vpn-core-v${pkgver}-beta.${pkgrel}_linux_${CARCH}"

  install -Dm755 "${_srcdir}/nym-vpnd" "${pkgdir}/usr/bin/nym-vpnd"
  install -Dm4755 "${_srcdir}/nym-exclude" "${pkgdir}/usr/bin/nym-exclude"
  install -Dm755 "${_srcdir}/nym-socks5-proxy" "${pkgdir}/usr/bin/nym-socks5-proxy"

  install -Dm644 nym-vpnd.service "${pkgdir}/usr/lib/systemd/system/nym-vpnd.service"
}
