# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Ian Heafer <archlinux at studio oneword turnip dot net>
# Contributor: Gianni Vialetto <g dot vialetto at gmail dot com>
# Contributor: Brian Miller :
# Contributor: Tom Kuther <gimpel@sonnenkinder.org>
# Contributor: Andrew Kotsyuba <avallach2000@gmail.com>

pkgname=iscan-plugin-gt-f720
pkgver=2.30.4
pkgrel=2
pkgdesc="EPSON Image Scan! plugin for Epson scanners (GT-F720, GT-S620, Perfection V30, Perfection V300 Photo)"
arch=('x86_64')
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('custom:EPSON EULA')
depends=('iscan')
source=("https://download2.ebz.epson.net/iscan/plugin/gt-f720/deb/x64/iscan-gt-f720-bundle-${pkgver}.x64.deb.tar.gz")
sha256sums=('9c466190c005467dac7df2512e8c6de182f1bd6cb30ae5e55918ad81299c4fce')
install="${pkgname}.install"

prepare() {
  cd "iscan-gt-f720-bundle-${pkgver}.x64.deb/plugins"
  bsdtar -xf "esci-interpreter-gt-f720_1.0.0-1_amd64.deb"
  bsdtar -xf data.tar.gz
  gzip -fkd "usr/share/doc/esci-interpreter-gt-f720/NEWS.gz"
  gzip -fkd "usr/share/doc/esci-interpreter-gt-f720/COPYING.EPSON.en.txt.gz"
}

package() {
  cd "iscan-gt-f720-bundle-${pkgver}.x64.deb/plugins/usr"
  # Install plugins
  install -m 755 -d "${pkgdir}/usr/lib/iscan"
  install -m 644 -t "${pkgdir}/usr/lib/iscan" "lib/esci/libesci-interpreter-gt-f720.so.0.0.0"
  ln -s "libesci-interpreter-gt-f720.so.0.0.0" "${pkgdir}/usr/lib/iscan/libesci-interpreter-gt-f720.so"
  ln -s "libesci-interpreter-gt-f720.so.0.0.0" "${pkgdir}/usr/lib/iscan/libesci-interpreter-gt-f720.so.0"
  # Install firmwares
  install -m 755 -d "${pkgdir}/usr/share/esci"
  install -m 644 -t "${pkgdir}/usr/share/esci" "share/esci/esfw8b.bin"
  # Install documentation
  install -m 755 -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    "share/doc/esci-interpreter-gt-f720/NEWS"
  # Install licenses
  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    "share/doc/esci-interpreter-gt-f720/COPYING.EPSON.en.txt"
}
