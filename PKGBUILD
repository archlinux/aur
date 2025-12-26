# Maintainer: Andrew Koidan <deathangel908@gmail.com>
pkgname=http-remote-pc-control
pkgver=1.1.1
PACKAGER="Andrew Koidan <deathangel908@gmail.com>"
commit=2a9713f
pkgrel=2
pkgdesc="HTTP remote PC control tool"
arch=('x86_64')
url="https://github.com/akoidan/http-remote-pc-control"
license=('MIT')
depends=(
  'libxtst'
  'xcb-util-wm'
  'dbus'
)
optdepends=(
  'openssl: generate TLS certificates on first start'
)
install=http-remote-pc-control.install

source=(
  "http-remote-pc-control::${url}/releases/download/${commit}/app.elf"
  "swagger.json::${url}/releases/download/${commit}/swagger.json"
  "http-remote-pc-control.service"
  "http-remote-pc-control.install"
  "http-remote-pc-control-gen-certs.sh"
  "san.cnf"
)
options=(!strip)
sha256sums=(
  '5854b81799a5150795791681685b71c4faeb8e346f77f499f3113012583f50fe'
  '35dd54cb3a415dc327c92637b1a7f629e0efb1eea2d5e8432c4134fa412383f4'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)

package() {
  install -D -m755 "${srcdir}/http-remote-pc-control" "${pkgdir}/usr/bin/http-remote-pc-control"
  install -D -m644 "${srcdir}/http-remote-pc-control.service" "${pkgdir}/usr/lib/systemd/user/http-remote-pc-control.service"
  install -D -m755 "${srcdir}/http-remote-pc-control-gen-certs.sh" "${pkgdir}/usr/share/http-remote-pc-control/gen-certs"
  install -D -m644 "${srcdir}/san.cnf" "${pkgdir}/usr/share/http-remote-pc-control/san.cnf"
  install -D -m644 "${srcdir}/swagger.json" "${pkgdir}/usr/share/http-remote-pc-control/swagger.json"
}