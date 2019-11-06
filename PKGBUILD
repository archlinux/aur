# Maintainer: Poscat <poscat At mail Dot poscat Dot moe>

pkgname=caddy2
pkgver=beta9
pkgrel=2
pkgdesc='Fast, cross-platform HTTP/2 web server with automatic HTTPS'
arch=('x86_64')
license=('Apache')
url='https://github.com/caddyserver/caddy'
depends=()
conflicts=('caddy')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/caddyserver/caddy/archive/v2.0.0-${pkgver}.tar.gz"
        "caddy.service")
sha256sums=('55c1093ed3ed55d0b27bb4c1e39727cecf8ad1787a4dea3e1bb28eb1ccbe91d1'
            'c3eb327ba564b167e508b2bfa76ef459cacef09fb2e67a7f09944cb8f92e3207')

build() {
  cd ${srcdir}/caddy-2.0.0-${pkgver}
  export GOPATH="$srcdir"
  go build -v -o caddy cmd/caddy/main.go
}

package() {
  mkdir -p "$pkgdir/etc/caddy"
  install -D -m 0644 caddy.service "$pkgdir/usr/lib/systemd/system/caddy.service"
  cd ${srcdir}/caddy-2.0.0-${pkgver}
  install -D -m 0755 caddy "$pkgdir/usr/bin/caddy"
}

