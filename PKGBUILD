# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Ian Heafer <archlinux at studio oneword turnip dot net>
# Contributor: Gianni Vialetto <g dot vialetto at gmail dot com>
# Contributor: Brian Miller :
# Contributor: Tom Kuther <gimpel@sonnenkinder.org>
# Contributor: Andrew Kotsyuba <avallach2000@gmail.com>

pkgname=iscan-plugin-gt-x720
pkgver=0.1.1
pkgrel=3
pkgdesc="EPSON Image Scan! plugin for Epson Perfection V30 scanner"
arch=('i686' 'x86_64')
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('custom:AVASYSPL')
depends=('iscan')
source_i686=("http://a1227.g.akamai.net/f/1227/40484/1d/download.ebz.epson.net/dsc/f/01/00/01/58/40/246a50b0b696c79f774c2a94628252420d7bd0e7/esci-interpreter-gt-f720_0.1.1-2_i386.deb")
source_x86_64=("http://a1227.g.akamai.net/f/1227/40484/1d/download.ebz.epson.net/dsc/f/01/00/01/58/40/ee5c33c71ca717cf6a3534673bcc1fdafd8a77da/esci-interpreter-gt-f720_0.1.1-2_amd64.deb")
sha256sums_i686=('6e6f7894e3c3fab1639a9310564ea6021a82ddff7e6c6b295b5bb83cfea45e80')
sha256sums_x86_64=('190b1e15e7d78d5e89b38448e990bcbcae9f532761c46b74bb77cd91952b9c67')
install="${pkgname}.install"

build() {
  cd "${srcdir}"
  bsdtar -xf data.tar.gz
  gzip -fkd "${srcdir}/usr/share/doc/esci-interpreter-gt-f720/NEWS.gz"
}

package() {
  cd "${srcdir}/usr"
  install -m 755 -d "${pkgdir}/usr/lib/iscan"
  install -m 644 -t "${pkgdir}/usr/lib/iscan" "lib/esci/libesci-interpreter-gt-f720.so.0.0.0"
  ln -s libesci-interpreter-gt-f720.so.0.0.0 "${pkgdir}/usr/lib/iscan/libesci-interpreter-gt-f720.so"
  ln -s libesci-interpreter-gt-f720.so.0.0.0 "${pkgdir}/usr/lib/iscan/libesci-interpreter-gt-f720.so.0"

  install -m 755 -d "${pkgdir}/usr/share/esci"
  install -m 644 -t "${pkgdir}/usr/share/esci" "share/esci/esfw8b.bin"

  install -m 755 -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" "share/doc/esci-interpreter-gt-f720"/{NEWS,README}

  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 "share/doc/esci-interpreter-gt-f720/AVASYSPL.en.txt" "${pkgdir}/usr/share/licenses/${pkgname}/AVASYSPL"
}
