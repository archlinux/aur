# Maintainer: 435qb <52435qb@gmail.com>
# Maintainer: meanlint <meanlint@outlook.com>
# Maintainer: Nicolas Stalder <n+archlinux@stalder.io>
# Maintainer: Shi Liang <shiliang2008@msn.com>
pkgname=caddy-naiveproxy-bin
pkgver=2.10.0
pkgrel=1
pkgdesc="Caddy web server"
arch=("x86_64")
url="https://github.com/caddyserver/caddy"
license=('Apache-2.0')
provides=("caddy")
conflicts=("caddy")
source=(
  "https://github.com/klzgrad/forwardproxy/releases/download/v${pkgver}-naive/caddy-forwardproxy-naive.tar.xz"
  "Caddyfile"
  "caddy.service"
  "caddy.sysusers"
  "caddy.tmpfiles"
  "Caddyfile-example"
)
sha256sums=(
  "SKIP"
  "SKIP"
  "SKIP"
  "SKIP"
  "SKIP"
  "SKIP"
)

package() {
  # Install the executables
  tar -xf "caddy-forwardproxy-naive.tar.xz"
  install -d "$pkgdir"/usr/bin/
  install -m 755 $srcdir/caddy-forwardproxy-naive/caddy "$pkgdir"/usr/bin/

  # Basic configuration with example
  install -Dm 644 "${srcdir}/Caddyfile" "${pkgdir}/etc/caddy/Caddyfile"
  install -d "${pkgdir}/etc/caddy/conf.d"
  install -Dm 644 "${srcdir}/Caddyfile-example" -t "${pkgdir}/etc/caddy/conf.d"

  # Systemd service setup
  install -Dm 644 "${srcdir}/caddy.service" -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm 644 "${srcdir}/caddy.sysusers" "${pkgdir}/usr/lib/sysusers.d/caddy.conf"
  install -Dm 644 "${srcdir}/caddy.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/caddy.conf"
}
