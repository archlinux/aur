# Maintainer: INhBQfUQO2eFzulN <281587887a at protonmail dot ch>

pkgname=iscan-plugin-cx4400
pkgver=2.30.4
pkgrel=3
pkgdesc="EPSON Image Scan! plugin for Epson scanners (Stylus CX4400)"
arch=('i686' 'x86_64')
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('custom:EPSON EULA')
depends=('iscan' 'iscan-data')
source_x86_64=("https://download2.ebz.epson.net/iscan/plugin/cx4400/deb/x64/iscan-cx4400-bundle-${pkgver}.x64.deb.tar.gz")
sha256sums_x86_64=('1033f226fe06f4422474d762292c3fee1cde59d18a35b969f60ad73090cf3278')
source_i686=("https://download2.ebz.epson.net/iscan/plugin/cx4400/deb/x86/iscan-cx4400-bundle-${pkgver}.x86.deb.tar.gz")
sha256sums_i686=('fd4f8e6ce36f9ef78f2ea9ec1add8877542b859948eade502575471a777a2d20')
install="${pkgname}.install"

prepare() {
  if [ "$CARCH" = "i686" ] ; then
    cd "iscan-cx4400-bundle-${pkgver}.x86.deb/plugins"
    bsdtar -xf "iscan-plugin-cx4400_2.1.4-1_i386.deb"
    bsdtar -xf data.tar.gz
    gzip -fkd "usr/share/doc/iscan-plugin-cx4400/COPYING.EPSON.en.txt.gz"
  elif [ "$CARCH" = "x86_64" ] ; then
  	cd "iscan-cx4400-bundle-${pkgver}.x64.deb/plugins"
    bsdtar -xf "iscan-plugin-cx4400_2.1.4-1_amd64.deb"
    bsdtar -xf data.tar.gz
    gzip -fkd "usr/share/doc/iscan-plugin-cx4400/COPYING.EPSON.en.txt.gz"
  fi
}

package() {
  if [ "$CARCH" = "i686" ] ; then
    cd "iscan-cx4400-bundle-${pkgver}.x86.deb/plugins/usr"
    # Install plugins
    install -m 755 -d "${pkgdir}/usr/lib/iscan"
    install -m 644 -t "${pkgdir}/usr/lib/iscan" "lib/iscan/libesint7E.so.2.0.0"
    ln -s "libesint7E.so.2.0.0" "${pkgdir}/usr/lib/iscan/libesint7E.so"
    ln -s "libesint7E.so.2.0.0" "${pkgdir}/usr/lib/iscan/libesint7E.so.2"
    # Install licenses
    install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
      "share/doc/iscan-plugin-cx4400/COPYING.EPSON.en.txt"
  elif [ "$CARCH" = "x86_64" ] ; then
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
  fi
}
