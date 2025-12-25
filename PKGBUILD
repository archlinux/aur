# Maintainer: Andrew Koidan <deathangel908@gmail.com>
pkgname=http-remote-pc-control
pkgver=1.1.0
commit=04c2737
pkgrel=1
pkgdesc="HTTP remote PC control tool"
arch=('x86_64')
url="https://github.com/akoidan/http-remote-pc-control"
license=('MIT')
makedepends=(
  'openssl'
)
depends=(
  'libxtst'
  'xcb-util-wm'
  'xorg-setxkbmap'
)
source=(
  "http-remote-pc-control::${url}/releases/download/${commit}/app.elf"
  "${pkgname}@.service"
  "http-remote-pc-control-certs.service"
  "http-remote-pc-control-gen-certs.sh"
  "http-remote-pc-control.sysusers.conf"
  "http-remote-pc-control.tmpfiles.conf"
  "san.cnf"
)

sha256sums=(
  '9009e02dda80354cf591ff8812dcf6b3e0ca8f59549cc823f54b3416214cb232'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)

package() {
  install -D -m755 "${srcdir}/http-remote-pc-control" "${pkgdir}/usr/bin/http-remote-pc-control"
  install -D -m644 "${srcdir}/${pkgname}@.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}@.service"
  install -D -m644 "${srcdir}/http-remote-pc-control-certs.service" "${pkgdir}/usr/lib/systemd/system/http-remote-pc-control-certs.service"
  install -D -m755 "${srcdir}/http-remote-pc-control-gen-certs.sh" "${pkgdir}/usr/lib/http-remote-pc-control/gen-certs"
  install -D -m644 "${srcdir}/http-remote-pc-control.sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/http-remote-pc-control.conf"
  install -D -m644 "${srcdir}/http-remote-pc-control.tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/http-remote-pc-control.conf"
  install -D -m644 "${srcdir}/san.cnf" "${pkgdir}/usr/share/http-remote-pc-control/san.cnf"
}