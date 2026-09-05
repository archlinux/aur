# Maintainer: eggy <d7chen@uwaterloo.ca>

pkgname=nightingale-server-bin
pkgver=1.2.0
pkgrel=2
pkgdesc="Self-hosted Nightingale web server binary"
arch=('x86_64' 'aarch64')
url="https://github.com/rzru/nightingale"
license=('GPL-3.0-only')
backup=('etc/nightingale-server/env')
depends=(
  'glibc'
)

optdepends=(
  'nginx: reverse proxy and TLS termination'
  'caddy: automatic HTTPS'
  'avahi: local network discovery'
)

provides=('nightingale-server')
conflicts=('nightingale-server')

install=nightingale-server.install

source=(
  "nightingale-server.service"
  "nightingale-server.sysusers"
  "nightingale-server.tmpfiles"
  "nginx.conf.example"
)

source_x86_64=(
  "nightingale-server-${pkgver}-x86_64.tar.gz::https://github.com/rzru/nightingale/releases/download/v${pkgver}/nightingale-server-x86_64-unknown-linux-gnu.tar.gz"
)

source_aarch64=(
  "nightingale-server-${pkgver}-aarch64.tar.gz::https://github.com/rzru/nightingale/releases/download/v${pkgver}/nightingale-server-aarch64-unknown-linux-gnu.tar.gz"
)

sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)

sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')


package() {
    # Binary
    install -Dm755 \
        "${srcdir}/nightingale" \
        "${pkgdir}/usr/bin/nightingale-server"


    # systemd service
    install -Dm644 \
        "${srcdir}/nightingale-server.service" \
        "${pkgdir}/usr/lib/systemd/system/nightingale-server.service"


    # system user
    install -Dm644 \
        "${srcdir}/nightingale-server.sysusers" \
        "${pkgdir}/usr/lib/sysusers.d/nightingale-server.conf"


    # persistent directories
    install -Dm644 \
        "${srcdir}/nightingale-server.tmpfiles" \
        "${pkgdir}/usr/lib/tmpfiles.d/nightingale-server.conf"


    # nginx example
    install -Dm644 \
        "${srcdir}/nginx.conf.example" \
        "${pkgdir}/usr/share/doc/nightingale-server/nginx.conf.example"
}
