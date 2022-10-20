# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: 0strodamus <0strodamus at cox dot net>
# Contributor: ItsTheSource <itsthesource at gmail dot com>

pkgname=iscan-plugin-ds-30
pkgver=2.30.4
pkgrel=3
pkgdesc="EPSON Image Scan! plugin for Epson scanners (WorkForce DS-30)"
arch=('x86_64')
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('custom:EPSON EULA')
depends=('iscan' 'iscan-data')
source=("https://download2.ebz.epson.net/iscan/plugin/ds-30/deb/x64/iscan-ds-30-bundle-${pkgver}.x64.deb.tar.gz")
sha256sums=('e42d7c79d7239b00f53c089e45815cd89d934d1dd7e937407ca595c44cd44715')
install="${pkgname}.install"

prepare() {
  cd "iscan-ds-30-bundle-${pkgver}.x64.deb/plugins"
  bsdtar -xf "iscan-plugin-ds-30_1.0.1-1_amd64.deb"
  bsdtar -xf data.tar.gz
  gzip -fkd "usr/share/doc/iscan-plugin-ds-30/NEWS.gz"
  gzip -fkd "usr/share/doc/iscan-plugin-ds-30/COPYING.EPSON.en.txt.gz"
}

package() {
  cd "iscan-ds-30-bundle-${pkgver}.x64.deb/plugins/usr"
  # Install plugins
  install -m 755 -d "${pkgdir}/usr/lib/iscan"
  install -m 644 -t "${pkgdir}/usr/lib/iscan" "lib/iscan/libiscan-plugin-ds-30.so.0.0.0"
  ln -s "libiscan-plugin-ds-30.so.0.0.0" "${pkgdir}/usr/lib/iscan/libiscan-plugin-ds-30.so"
  ln -s "libiscan-plugin-ds-30.so.0.0.0" "${pkgdir}/usr/lib/iscan/libiscan-plugin-ds-30.so.0"
  # Install documentation
  install -m 755 -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    "share/doc/iscan-plugin-ds-30/NEWS"
  # Install licenses
  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    "share/doc/iscan-plugin-ds-30/COPYING.EPSON.en.txt"
}
