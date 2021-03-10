# Maintainer: INhBQfUQO2eFzulN <281587887a at protonmail dot ch>

pkgname=iscan-plugin-cx4400
pkgver=2.30.4
pkgrel=1
pkgdesc="EPSON Image Scan! plugin for Epson scanners (Stylus CX4400)"
arch=('x86_64')
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('custom:EPSON EULA')
depends=('iscan' 'iscan-data')
source=("https://download2.ebz.epson.net/iscan/plugin/cx4400/deb/x64/iscan-cx4400-bundle-${pkgver}.x64.deb.tar.gz")
sha256sums=('1033f226fe06f4422474d762292c3fee1cde59d18a35b969f60ad73090cf3278')
install="${pkgname}.install"

prepare() {
  cd "iscan-cx4400-bundle-${pkgver}.x64.deb/plugins"
  bsdtar -xf "iscan-plugin-cx4400_2.1.4-1_amd64.deb"
  bsdtar -xf data.tar.gz
  gzip -fkd "usr/share/doc/iscan-plugin-cx4400/COPYING.EPSON.en.txt.gz"
}

package() {
  cd "iscan-cx4400-bundle-${pkgver}.x64.deb/plugins/usr"
  # Install plugins
  install -m 755 -d "${pkgdir}/usr/lib/iscan"
  install -m 644 -t "${pkgdir}/usr/lib/iscan" "lib/iscan/libesint7E.so.2.0.0"
  ln -s "libesint7E.so.2.0.0" "${pkgdir}/usr/lib/iscan/libesint7E.so"
  ln -s "libesint7E.so.2.0.0" "${pkgdir}/usr/lib/iscan/libesint7E.so.2"
  # Install licenses
  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    "share/doc/iscan-plugin-cx4400/COPYING.EPSON.en.txt"
}
