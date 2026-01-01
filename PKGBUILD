# Maintainer: Andrew Koidan <deathangel908@gmail.com>
pkgname=http-remote-pc-control
pkgver=1.1.4
PACKAGER="Andrew Koidan <deathangel908@gmail.com>"
tag=v1.1.4
pkgrel=1
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
  "http-remote-pc-control::${url}/releases/download/${tag}/http-remote-pc-control.elf"
  "swagger.json::${url}/releases/download/${tag}/swagger.json"
  "http-remote-pc-control.service"
  "http-remote-pc-control.install"
  "gen-certs.sh"
  "san.cnf"
)
options=(!strip)
sha256sums=('b3a6ac06a9237b9e4870f0b871c464da2722b4a54fb4c45ba8fe4e50e4da8f4a'
            '35dd54cb3a415dc327c92637b1a7f629e0efb1eea2d5e8432c4134fa412383f4'
            '83c87c4eb2abce1b40b26bd05dac2be439b64814821a7859545098b7b3601eb9'
            'a75e2cf6c74cc74e82ffd8c83d4942967025b2853f4e3a146f8a1244426b0171'
            '201f45a79a8add80eb759802d14aa4340efdfe18cdc67208e264098806ef22ac'
            '28f264af9f32cb2461d015a9f7054e40e389cffbcd5db5edbe7376e4c0dba82e')

package() {
  install -D -m755 "${srcdir}/http-remote-pc-control" "${pkgdir}/usr/bin/http-remote-pc-control"
  install -D -m644 "${srcdir}/http-remote-pc-control.service" "${pkgdir}/usr/lib/systemd/user/http-remote-pc-control.service"
  install -D -m755 "${srcdir}/gen-certs.sh" "${pkgdir}/usr/share/http-remote-pc-control/gen-certs"
  install -D -m644 "${srcdir}/san.cnf" "${pkgdir}/usr/share/http-remote-pc-control/san.cnf"
  install -D -m644 "${srcdir}/swagger.json" "${pkgdir}/usr/share/http-remote-pc-control/swagger.json"
}
