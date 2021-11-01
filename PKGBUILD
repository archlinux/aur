# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=epsonscan2-non-free-plugin
pkgver=1.0.0.5
pkgrel=1
_epsonscan2_ver=6.6.2.5
arch=('i686' 'x86_64')
pkgdesc="Plugins for Epson Scan 2"
url="http://support.epson.net/linux/en/epsonscan2.php"
license=('custom')
depends=('epsonscan2')
makedepends=('xxd')
replaces=('epsonscan2-non-free-plugin-bin')
source_i686=("https://download2.ebz.epson.net/epsonscan2/common/deb/x86/epsonscan2-bundle-${_epsonscan2_ver}.i686.deb.tar.gz")
source_x86_64=("https://download2.ebz.epson.net/epsonscan2/common/deb/x64/epsonscan2-bundle-${_epsonscan2_ver}.x86_64.deb.tar.gz")
sha512sums_i686=('0c3afe5231793a9727a6a160ba58f16e0dda6d65281ac81616d93520ea829e447ce590d3a72012fc38b35ff1c4e83c81b7dd7e55474d6d6dcf2d5c2bce4895ed')
sha512sums_x86_64=('6f777e1f3c90693611078fa8bb942744271c8c7dcfc44d9a2eda9f14e5cd1c07c407593ca2aeb5ad30e6e96a0f8b144e10613907c4fcf4e649dc2198e7079ec9')

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
