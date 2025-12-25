# Maintainer: Andrew Koidan <deathangel908@gmail.com>
pkgname=http-remote-pc-control
pkgver=1.1.0
commit=bcab20b
pkgrel=1
pkgdesc="HTTP remote PC control tool"
arch=('x86_64')
url="https://github.com/akoidan/http-remote-pc-control"
license=('MIT')
depends=(
  'libxtst'
  'xcb-util-wm'
  'xorg-setxkbmap'
)
optdepends=(
  'openssl: generate TLS certificates on first start'
)
source=(
  "http-remote-pc-control::${url}/releases/download/${commit}/app.elf"
  "${pkgname}.service"
  "http-remote-pc-control-gen-certs.sh"
  "san.cnf"
)
options=(!strip)
sha256sums=(
  'a9dda35d0852ca0493cb99f5148b583772c61ca82d54c48cd9e0d285221ffbb4'
  'SKIP'
  'SKIP'
  'SKIP'
)

package() {
  install -D -m755 "${srcdir}/http-remote-pc-control" "${pkgdir}/usr/bin/http-remote-pc-control"
  install -D -m644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/user/${pkgname}.service"
  install -D -m755 "${srcdir}/http-remote-pc-control-gen-certs.sh" "${pkgdir}/usr/lib/http-remote-pc-control/gen-certs"
  install -D -m644 "${srcdir}/san.cnf" "${pkgdir}/usr/lib/http-remote-pc-control/san.cnf"
}