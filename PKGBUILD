# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=iscan-plugin-gt-s650
pkgver=2.30.4
pkgrel=1
pkgdesc="EPSON Image Scan! plugin for Epson scanners (DS, EP, ES, ET, EW, L, LX, PX, WF, XP Series, FF-640, GT-S650, Perfection V19, Perfection V39)"
arch=('x86_64')
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('custom:EPSON EULA')
depends=('iscan' 'iscan-data')
source=("https://download2.ebz.epson.net/iscan/plugin/gt-s650/deb/x64/iscan-gt-s650-bundle-${pkgver}.x64.deb.tar.gz")
sha256sums=('0d7a0fd6a19be7d3acde64c631dbbda6b91b59584a2535e308499e53cb130b58')
install="${pkgname}.install"

prepare() {
  cd "iscan-gt-s650-bundle-${pkgver}.x64.deb/plugins"
  bsdtar -xf "iscan-plugin-gt-s650_1.1.1-1_amd64.deb"
  bsdtar -xf data.tar.gz
  gzip -fkd "usr/share/doc/iscan-plugin-gt-s650/NEWS.gz"
  gzip -fkd "usr/share/doc/iscan-plugin-gt-s650/COPYING.EPSON.en.txt.gz"
}

package() {
  cd "iscan-gt-s650-bundle-${pkgver}.x64.deb/plugins/usr"
  # Install plugins
  install -m 755 -d "${pkgdir}/usr/lib/iscan"
  install -m 644 -t "${pkgdir}/usr/lib/iscan" "lib/iscan/libiscan-plugin-gt-s650.so.0.0.0"
  ln -s "libiscan-plugin-gt-s650.so.0.0.0" "${pkgdir}/usr/lib/iscan/libiscan-plugin-gt-s650.so"
  ln -s "libiscan-plugin-gt-s650.so.0.0.0" "${pkgdir}/usr/lib/iscan/libiscan-plugin-gt-s650.so.0"
  # Install firmwares
  install -m 755 -d "${pkgdir}/usr/share/iscan"
  install -m 644 -t "${pkgdir}/usr/share/iscan" "share/iscan/esfw010c.bin"
  # Install shared data
  install -m 755 -d "${pkgdir}/usr/share/iscan-data/device"
  install -m 644 -t "${pkgdir}/usr/share/iscan-data/device" "share/iscan-data/device/50657266656374696f6e20563139.xml"
  install -m 644 -t "${pkgdir}/usr/share/iscan-data/device" "share/iscan-data/device/50657266656374696f6e20563339.xml"
  # Install documentation
  install -m 755 -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    "share/doc/iscan-plugin-gt-s650/NEWS"
  # Install licenses
  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    "share/doc/iscan-plugin-gt-s650/COPYING.EPSON.en.txt" \
    "share/doc/iscan-plugin-gt-s650/copyright"
}
