# Maintainer: 435qb <52435qb@gmail.com>
# Maintainer: meanlint <meanlint@outlook.com>
# Maintainer: Nicolas Stalder <n+archlinux@stalder.io>
# Maintainer: Shi Liang <shiliang2008@msn.com>
pkgname=caddy-naiveproxy-bin
pkgver=2.11.7
pkgrel=1
pkgdesc="Caddy web server"
arch=("x86_64")
url="https://github.com/caddyserver/caddy"
license=('Apache-2.0')
provides=("caddy")
conflicts=("caddy")
source=(
  "https://github.com/klzgrad/forwardproxy/releases/download/v${pkgver}-naive2/caddy-forwardproxy-naive.tar.xz"
  "Caddyfile"
  "caddy.service"
  "caddy.sysusers"
  "caddy.tmpfiles"
  "Caddyfile-example"
)
sha256sums=('c273dc07dd79c5919f97639cbdcb559d40ce90475dbd8aac80641b0a8c8065ff'
            '9bca9b879484cd1e6c7191c83e077ba9c851c2c10c998333219179bfb0fb93f7'
            'dbaedf6929f5292d9ec32d2bcb4990cb3747b58940b385d26564e1abb5dd89ab'
            'a9294eeba17a8fd57cf11cef21e2eb3719a016646eeac0764a0d9f9f380a40ef'
            'c3119c98b285c4bf10c0581fba09b87df3999e0e5a335d94f074eae454a99e70'
            '5e7ebbe2b5b85bb6ecd8849910869b30f8b072c387279678992e84e9c23474b0')

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
