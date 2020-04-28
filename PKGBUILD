# Maintainer: Arisu  <alice at gaudon dot pro>
# Contributor: Sylwek  <skmtrn at gmail dot com>
# Contributor: Poscat <poscat at mail dot poscat dot moe>

pkgname=caddy2
pkgver=rc.3
pkgrel=1
pkgdesc='Fast, cross-platform HTTP/2 web server with automatic HTTPS'
arch=('x86_64')
license=('Apache')
url='https://github.com/caddyserver/caddy'
depends=()
conflicts=('caddy')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/caddyserver/caddy/archive/v2.0.0-${pkgver}.tar.gz"
        "Caddyfile"
        "caddy.service")

sha256sums=('55d26bea8e37860db026c12da187e82b6fd1795c365138391856c5d3fcaeec37'
            'adf24a575a20ae9f503fac2348f7cfd26256f167992a1938f1a53a6d77b9b1f4'
            'c3eb327ba564b167e508b2bfa76ef459cacef09fb2e67a7f09944cb8f92e3207')

build() {
  cd ${srcdir}/caddy-2.0.0-${pkgver}
  export GOPATH="$srcdir"
  go build -v -o caddy cmd/caddy/main.go
}

package() {
  mkdir -p "$pkgdir/var/lib/caddy2"
  install -D -m 0644 Caddyfile "$pkgdir/etc/caddy2/Caddyfile"
  install -D -m 0644 caddy.service "$pkgdir/usr/lib/systemd/system/caddy.service"
  cd ${srcdir}/caddy-2.0.0-${pkgver}
  install -D -m 0755 caddy "$pkgdir/usr/bin/caddy"
}

