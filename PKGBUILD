# Maintainer: Nym <ops@nymte.ch>
# Maintainer: Andrej Mihajlov <andrej@nymtech.net>
# Maintainer: Lawrence Stalder <lawrence.stalder@pm.me>
# Contributor: Pierre Dommerc <pierre@nymtech.net>

pkgname=nym-vpnd-bin
pkgver=2026.11.1
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
source_x86_64=("$url/releases/download/nym-vpn-v2026.11.1/nym-vpn-core-v2026.11.1_linux_x86_64.tar.gz" 'nym-vpnd.service')
source_aarch64=("$url/releases/download/nym-vpn-v2026.11.1/nym-vpn-core-v2026.11.1_linux_aarch64.tar.gz" 'nym-vpnd.service')
sha256sums_x86_64=(d3d9da510404e731c3cc53865b37cce4b2e85bbeec43a082702bff4451f46c3e 66d5b043cbef2ae0ba19cc7685c7b42808515b8b520b0dd15a0c313ca039f6d6)
sha256sums_aarch64=(076d4a6ecd5a2f5d1f4d9f3b80f02f6d01f03c492861c2f131fdb078560d159a 66d5b043cbef2ae0ba19cc7685c7b42808515b8b520b0dd15a0c313ca039f6d6)

package() {
  pushd "nym-vpn-core-v2026.11.1_linux_${CARCH}"
  install -Dm755 "nym-vpnd" "$pkgdir/usr/bin/nym-vpnd"
  install -Dm755 "nym-exclude" "$pkgdir/usr/bin/nym-exclude"
  chmod u+s "$pkgdir/usr/bin/nym-exclude"
  install -Dm755 "nym-socks5-proxy" "$pkgdir/usr/bin/nym-socks5-proxy"
  popd

  install -Dm644 nym-vpnd.service "$pkgdir/usr/lib/systemd/system/nym-vpnd.service"
}
