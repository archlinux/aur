# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=epsonscan2-non-free-plugin
pkgver=1.0.0.4
pkgrel=1
_epsonscan2_ver=6.6.2.3
arch=('i686' 'x86_64')
pkgdesc="Plugins for Epson Scan 2"
url="http://support.epson.net/linux/en/epsonscan2.php"
license=('custom')
depends=('epsonscan2')
makedepends=('xxd')
source_i686=("https://download2.ebz.epson.net/epsonscan2/common/deb/x86/epsonscan2-bundle-${_epsonscan2_ver}.i686.deb.tar.gz")
source_x86_64=("https://download2.ebz.epson.net/epsonscan2/common/deb/x64/epsonscan2-bundle-${_epsonscan2_ver}.x86_64.deb.tar.gz")
sha512sums_i686=('52323244db52eb8fde3a24b381ee66581f5c7fcc979dd62598ff1103062b5e478d35b36c828ea09a411bb5e0a8bae6f9131e8d81e9c8cc7810215a7c6cef9681')
sha512sums_x86_64=('7adede8b56305c70695b6832b3a8cf7ab442f679c2ea52d508c60fcaeeadf04b2eb67960d678630b9d090253afc11147ceb82e06d0777184c8faf61109a2b886')

prepare() {
  cd epsonscan2-bundle-${_epsonscan2_ver}*/plugins
  ar x epsonscan2-non-free-plugin*.deb
  tar -xJf data.tar.xz -C "${srcdir}"
}

package() {
  install -d "${pkgdir}/usr/lib/"
  cd "${srcdir}/usr"
  mv lib/*/epsonscan2* "${pkgdir}/usr/lib"
  mv libexec/epsonscan2-ocr/ocr-engine-getrotate "${pkgdir}/usr/lib/epsonscan2-ocr"
  mv share "${pkgdir}/usr"
  install -Dm644 "${pkgdir}/usr/share/doc/${pkgname}-${pkgver}-1/copyright" \
                 "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
