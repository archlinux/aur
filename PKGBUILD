# Maintainer: Nym <ops@nymte.ch>
# Maintainer: Pierre Dommerc <pierre@nymtech.net>
# Maintainer: Lawrence Stalder <lawrence.stalder@pm.me>

pkgname=nym-vpnd-bin
pkgver=2026.10.0
# upstream version
_pkgver=2026.10.0
_release_tag=nym-vpn-core-v2026.10.0
pkgrel=2
pkgdesc='NymVPN daemon as a systemd service'
arch=('x86_64')
url='https://github.com/nymtech/nym-vpn-client'
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs' 'dbus' 'libmnl' 'libnftnl' 'polkit')
makedepends=()
provides=('nym-vpnd' 'nym-exclude' 'nym-socks5-proxy')
conflicts=('nym-vpnd')
options=(!debug)
source=("$url/releases/download/$_release_tag/nym-vpn-core-v${_pkgver}_linux_x86_64.tar.gz"
    'nym-vpnd.service')
sha256sums=(
    '939ab832dc224b627c43b6c2a562073ba5dbcd530579abe3be13ad1fd2136c9b' 
    '66d5b043cbef2ae0ba19cc7685c7b42808515b8b520b0dd15a0c313ca039f6d6')

package() {
  install -Dm755 "nym-vpn-core-v${_pkgver}_linux_x86_64/nym-vpnd" "$pkgdir/usr/bin/nym-vpnd"
  #install -Dm755 "nym-vpn-core-v${_pkgver}_linux_x86_64/nym-exclude" "$pkgdir/usr/bin/nym-exclude"
  #chmod u+s "$pkgdir/usr/bin/nym-exclude"
  install -Dm755 "nym-vpn-core-v${_pkgver}_linux_x86_64/nym-socks5-proxy" "$pkgdir/usr/bin/nym-socks5-proxy"
  install -Dm644 nym-vpnd.service "$pkgdir/usr/lib/systemd/system/nym-vpnd.service"
}
