# Maintainer: Nym <ops@nymte.ch>
# Maintainer: Andrej Mihajlov <andrej@nymtech.net>
# Maintainer: Lawrence Stalder <lawrence.stalder@pm.me>
# Contributor: Pierre Dommerc <pierre@nymtech.net>

pkgname=nym-vpnd-bin
pkgver=2026.16.0
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
source_x86_64=("$url/releases/download/nym-vpn-v2026.16.0/nym-vpn-core-v2026.16.0_linux_x86_64.tar.gz" 'nym-vpnd.service' 'nym-vpn.conf')
source_aarch64=("$url/releases/download/nym-vpn-v2026.16.0/nym-vpn-core-v2026.16.0_linux_aarch64.tar.gz" 'nym-vpnd.service' 'nym-vpn.conf')
sha256sums_x86_64=(9cf6c288e5b7dd2d6437d3c3d2a953caa320da8a9c606d34a4ab8ecf96d6c7ce 5252c7e76941e2941a1469b603d7fc9b5844e0033ce40152873475fd1c5616d0 af03cbdb98708e60038d784503d99f382595f3a1e020fea41d5c2cc5800de319)
sha256sums_aarch64=(d43a28ae1dd1ed896dc09303d4d0ae33c23817e8cc05cb72bf23ee927e15b2ce 5252c7e76941e2941a1469b603d7fc9b5844e0033ce40152873475fd1c5616d0 af03cbdb98708e60038d784503d99f382595f3a1e020fea41d5c2cc5800de319)

package() {
  pushd "nym-vpn-core-v2026.16.0_linux_${CARCH}"
  install -Dm755 "nym-vpnd" "$pkgdir/usr/bin/nym-vpnd"
  install -Dm755 "nym-exclude" "$pkgdir/usr/bin/nym-exclude"
  chmod u+s "$pkgdir/usr/bin/nym-exclude"
  install -Dm755 "nym-socks5-proxy" "$pkgdir/usr/bin/nym-socks5-proxy"
  popd

  install -Dm644 nym-vpnd.service "$pkgdir/usr/lib/systemd/system/nym-vpnd.service"
  install -Dm644 nym-vpn.conf "$pkgdir/usr/lib/sysusers.d/nym-vpn.conf"
}
