# Maintainer: Andrew Koidan <deathangel908@gmail.com>
pkgname=http-remote-pc-control
pkgver=1.1.2
PACKAGER="Andrew Koidan <deathangel908@gmail.com>"
tag=1.1.3
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
  "http-remote-pc-control::${url}/releases/download/${tag}/app.elf"
  "swagger.json::${url}/releases/download/${tag}/swagger.json"
  "http-remote-pc-control.service"
  "http-remote-pc-control.install"
  "http-remote-pc-control-gen-certs.sh"
  "san.cnf"
)
options=(!strip)
sha256sums=('0acba1afeca103f959c09a0b60cdbfc769984676066d676c2f9618a8d03f0208'
            '35dd54cb3a415dc327c92637b1a7f629e0efb1eea2d5e8432c4134fa412383f4'
            'be3aa51b9cf0340d3fb172ba33cbe9bb70fefb9e33e6445f965b75564c8d83ed'
            'a75e2cf6c74cc74e82ffd8c83d4942967025b2853f4e3a146f8a1244426b0171'
            '201f45a79a8add80eb759802d14aa4340efdfe18cdc67208e264098806ef22ac'
            '28f264af9f32cb2461d015a9f7054e40e389cffbcd5db5edbe7376e4c0dba82e')

package() {
  install -D -m755 "${srcdir}/http-remote-pc-control" "${pkgdir}/usr/bin/http-remote-pc-control"
  install -D -m644 "${srcdir}/http-remote-pc-control.service" "${pkgdir}/usr/lib/systemd/user/http-remote-pc-control.service"
  install -D -m755 "${srcdir}/http-remote-pc-control-gen-certs.sh" "${pkgdir}/usr/share/http-remote-pc-control/gen-certs"
  install -D -m644 "${srcdir}/san.cnf" "${pkgdir}/usr/share/http-remote-pc-control/san.cnf"
  install -D -m644 "${srcdir}/swagger.json" "${pkgdir}/usr/share/http-remote-pc-control/swagger.json"
}
