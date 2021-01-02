# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=epsonscan2-non-free-plugin-bin
_pkgname=${pkgname%-bin}
pkgver=1.0.0.3
pkgrel=1
_epsonscan2_ver=6.6.2.2
arch=('i686' 'x86_64')
pkgdesc="Plugins for Epson Scan 2"
url="http://support.epson.net/linux/en/epsonscan2.php"
license=('custom')
depends=('epsonscan2')
makedepends=('xxd')
source_i686=("https://download2.ebz.epson.net/epsonscan2/common/deb/x86/epsonscan2-bundle-${_epsonscan2_ver}.i686.deb.tar.gz")
source_x86_64=("https://download2.ebz.epson.net/epsonscan2/common/deb/x64/epsonscan2-bundle-${_epsonscan2_ver}.x86_64.deb.tar.gz")
sha512sums_i686=('937a5961a99a7cecae833da5442edf5a57d7004bd55fb5f5fe18c64d41c35e5ec3157935c51dcc467f8bc432cee23d7f045ccbd8bbaea3bcbb8f170f1a6eca4d')
sha512sums_x86_64=('47b92784edf2bf21364e15a47f389f8544ddc93335179bfdbc748b3a70b2743384f7f02394cfa09654e7d073d9df0e73d3acc2028cd5cf0a215dc9e9574107c4')

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
  install -Dm644 "${pkgdir}/usr/share/doc/${_pkgname}-${pkgver}-1/copyright" \
                 "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
