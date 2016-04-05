pkgname='vpn-ws'
pkgver=r147.9d0e866
pkgrel=1
pkgdesc="A VPN server over websockets"
url="https://github.com/unbit/vpn-ws"
license=('GPL3')
makedepends=('git')
depends=('openssl')
arch=('any')
source=("git+https://github.com/unbit/vpn-ws.git")

pkgver() {
  cd "$srcdir/vpn-ws"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/vpn-ws"
  export CFLAGS="-Wno-error=implicit-int $CFLAGS"
  make vpn-ws vpn-ws-client
  install -m 755 -d "${pkgdir}/usr/bin"
  install -m 755 vpn-ws "${pkgdir}/usr/bin/vpn-ws"
  install -m 755 vpn-ws-client "${pkgdir}/usr/bin/vpn-ws-client"
}
md5sums=('SKIP')
