# Maintainer: Nym <ops@nymte.ch>
# Maintainer: Andrej Mihajlov <andrej@nymtech.net>
# Maintainer: Lawrence Stalder <lawrence.stalder@pm.me>
# Contributor: Pierre Dommerc <pierre@nymtech.net>

pkgname=nym-vpnd-bin
pkgver=2026.12.1
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
source_x86_64=("$url/releases/download/nym-vpn-v2026.12.1/nym-vpn-core-v2026.12.1_linux_x86_64.tar.gz" 'nym-vpnd.service' 'nym-vpn.conf')
source_aarch64=("$url/releases/download/nym-vpn-v2026.12.1/nym-vpn-core-v2026.12.1_linux_aarch64.tar.gz" 'nym-vpnd.service' 'nym-vpn.conf')
sha256sums_x86_64=(74ede0d911ec624de57584f93fce98f442a173112aa4ba5b655c8422e99b2140 66d5b043cbef2ae0ba19cc7685c7b42808515b8b520b0dd15a0c313ca039f6d6 af03cbdb98708e60038d784503d99f382595f3a1e020fea41d5c2cc5800de319)
sha256sums_aarch64=(8f29713555466e03881089629b2ade4f95e09e5c724a0811493d53380ca0e6fc 66d5b043cbef2ae0ba19cc7685c7b42808515b8b520b0dd15a0c313ca039f6d6 af03cbdb98708e60038d784503d99f382595f3a1e020fea41d5c2cc5800de319)

package() {
  pushd "nym-vpn-core-v2026.12.1_linux_${CARCH}"
  install -Dm755 "nym-vpnd" "$pkgdir/usr/bin/nym-vpnd"
  install -Dm755 "nym-exclude" "$pkgdir/usr/bin/nym-exclude"
  chmod u+s "$pkgdir/usr/bin/nym-exclude"
  install -Dm755 "nym-socks5-proxy" "$pkgdir/usr/bin/nym-socks5-proxy"
  popd

  install -Dm644 nym-vpnd.service "$pkgdir/usr/lib/systemd/system/nym-vpnd.service"
  install -Dm644 nym-vpn.conf "$pkgdir/usr/lib/sysusers.d/nym-vpn.conf"
}
