# Maintainer: Nym <ops@nymte.ch>
# Maintainer: Andrej Mihajlov <andrej@nymtech.net>
# Maintainer: Lawrence Stalder <lawrence.stalder@pm.me>
# Contributor: Pierre Dommerc <pierre@nymtech.net>

pkgname=nym-vpnd-bin
pkgver=2026.11.3
pkgrel=1
pkgdesc='NymVPN daemon as a systemd service'
arch=('x86_64' 'aarch64')
url='https://github.com/nymtech/nym-vpn-client'
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs' 'dbus' 'libmnl' 'libnftnl' 'polkit')
makedepends=()
provides=('nym-vpnd' 'nym-exclude' 'nym-socks5-proxy')
conflicts=('nym-vpnd')
options=(!debug)
source_x86_64=("$url/releases/download/nym-vpn-v2026.11.3/nym-vpn-core-v2026.11.3_linux_x86_64.tar.gz" 'nym-vpnd.service')
source_aarch64=("$url/releases/download/nym-vpn-v2026.11.3/nym-vpn-core-v2026.11.3_linux_aarch64.tar.gz" 'nym-vpnd.service')
sha256sums_x86_64=(32d9d9671cce5844df96174a61d27cfbe9138088c4e17baa7834c24d9c3eef04 66d5b043cbef2ae0ba19cc7685c7b42808515b8b520b0dd15a0c313ca039f6d6)
sha256sums_aarch64=(5535c9888f53c80fcd62effbdde7f62a8ace93c1e15d71fe66bef90866803928 66d5b043cbef2ae0ba19cc7685c7b42808515b8b520b0dd15a0c313ca039f6d6)

package() {
  pushd "nym-vpn-core-v2026.11.3_linux_${CARCH}"
  install -Dm755 "nym-vpnd" "$pkgdir/usr/bin/nym-vpnd"
  install -Dm755 "nym-exclude" "$pkgdir/usr/bin/nym-exclude"
  chmod u+s "$pkgdir/usr/bin/nym-exclude"
  install -Dm755 "nym-socks5-proxy" "$pkgdir/usr/bin/nym-socks5-proxy"
  popd

  install -Dm644 nym-vpnd.service "$pkgdir/usr/lib/systemd/system/nym-vpnd.service"
}
