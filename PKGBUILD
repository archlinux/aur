# Maintainer: Nym <ops@nymte.ch>
# Maintainer: Andrej Mihajlov <andrej@nymtech.net>
# Maintainer: Lawrence Stalder <lawrence.stalder@pm.me>
# Contributor: Pierre Dommerc <pierre@nymtech.net>

pkgname=nym-vpnd-bin
pkgver=2026.12.4
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
source_x86_64=("$url/releases/download/nym-vpn-v2026.12.4/nym-vpn-core-v2026.12.4_linux_x86_64.tar.gz" 'nym-vpnd.service' 'nym-vpn.conf')
source_aarch64=("$url/releases/download/nym-vpn-v2026.12.4/nym-vpn-core-v2026.12.4_linux_aarch64.tar.gz" 'nym-vpnd.service' 'nym-vpn.conf')
sha256sums_x86_64=(17ec7c1d41395328aada6a71633ba11c9a152960d836f00ba6a9792fb0aa76a4 66d5b043cbef2ae0ba19cc7685c7b42808515b8b520b0dd15a0c313ca039f6d6 af03cbdb98708e60038d784503d99f382595f3a1e020fea41d5c2cc5800de319)
sha256sums_aarch64=(cca9b7bf98aab43d481b5a3ad0098300ee08e3d2e11497b423a71457ab8b565a 66d5b043cbef2ae0ba19cc7685c7b42808515b8b520b0dd15a0c313ca039f6d6 af03cbdb98708e60038d784503d99f382595f3a1e020fea41d5c2cc5800de319)

package() {
  pushd "nym-vpn-core-v2026.12.4_linux_${CARCH}"
  install -Dm755 "nym-vpnd" "$pkgdir/usr/bin/nym-vpnd"
  install -Dm755 "nym-exclude" "$pkgdir/usr/bin/nym-exclude"
  chmod u+s "$pkgdir/usr/bin/nym-exclude"
  install -Dm755 "nym-socks5-proxy" "$pkgdir/usr/bin/nym-socks5-proxy"
  popd

  install -Dm644 nym-vpnd.service "$pkgdir/usr/lib/systemd/system/nym-vpnd.service"
  install -Dm644 nym-vpn.conf "$pkgdir/usr/lib/sysusers.d/nym-vpn.conf"
}
