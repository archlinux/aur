# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Alistair Grant <akgrant0710 at gmail dot com>

pkgname=iscan-plugin-perfection-v370
pkgver=2.30.4
pkgrel=2
pkgdesc="EPSON Image Scan! plugin for Epson scanners (GT-F740, GT-S640, Perfection V37, Perfection V370)"
arch=('x86_64')
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('custom:EPSON EULA')
depends=('iscan' 'iscan-data')
source=("https://download2.ebz.epson.net/iscan/plugin/perfection-v370/deb/x64/iscan-perfection-v370-bundle-${pkgver}.x64.deb.tar.gz")
sha256sums=('7b44da1637432717aa2a2f7fd7dfbb04bcf486310484ce1c0a63ef5cb9968a32')
install="${pkgname}.install"

prepare() {
  cd "iscan-perfection-v370-bundle-${pkgver}.x64.deb/plugins"
  bsdtar -xf "iscan-plugin-perfection-v370_1.0.1-1_amd64.deb"
  bsdtar -xf data.tar.gz
  gzip -fkd "usr/share/doc/iscan-plugin-perfection-v370/NEWS.gz"
  gzip -fkd "usr/share/doc/iscan-plugin-perfection-v370/COPYING.EPSON.en.txt.gz"
}

package() {
  cd "iscan-perfection-v370-bundle-${pkgver}.x64.deb/plugins/usr"
  # Install plugins
  install -m 755 -d "${pkgdir}/usr/lib/iscan"
  install -m 644 -t "${pkgdir}/usr/lib/iscan" "lib/iscan/lib${pkgname}.so.0.0.0"
  ln -s "lib${pkgname}.so.0.0.0" "${pkgdir}/usr/lib/iscan/lib${pkgname}.so"
  ln -s "lib${pkgname}.so.0.0.0" "${pkgdir}/usr/lib/iscan/lib${pkgname}.so.0"
  # Install firmwares
  install -m 755 -d "${pkgdir}/usr/share/iscan"
  install -m 644 -t "${pkgdir}/usr/share/iscan" "share/iscan/esfwdd.bin"
  # Install shared data
  install -m 755 -d "${pkgdir}/usr/share/iscan-data/device"
  install -m 644 -t "${pkgdir}/usr/share/iscan-data/device" \
    "share/iscan-data/device/47542d46373430.xml" \
    "share/iscan-data/device/47542d53363430.xml"
  # Install documentation
  install -m 755 -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    "share/doc/${pkgname}/NEWS"
  # Install licenses
  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    "share/doc/iscan-plugin-perfection-v370/COPYING.EPSON.en.txt" \
    "share/doc/iscan-plugin-perfection-v370/copyright"
}
