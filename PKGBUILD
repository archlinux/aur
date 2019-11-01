# Maintainer: Marco Steiger <marco (at) steiger (dot) online>
pkgname=structorizer
pkgver=3.30.01
pkgrel=1
relver="3.30-01"
pkgdesc="Structorizer is a little tool which you can use to create Nassi-Shneiderman Diagrams (NSD)"
url="https://structorizer.fisch.lu"
arch=('x86_64' 'i686')
license=('GPLv3')
makedepends=('unzip')
depends=('java-runtime')
install=${pkgname}.install
source=("${pkgname}-${pkgver}.zip::https://github.com/fesch/Structorizer.Desktop/releases/download/${relver}/structorizer_${relver}.zip"
        "${pkgname}.desktop"
        "${pkgname}.png::https://structorizer.fisch.lu/Pictures/structorizer.png"
        "${pkgname}")
sha256sums=('19f9ad4c33e1505fd24e2859f7fcf76434a016ed3af32679ec9fb1754c869c05'
            'f0daaecd3bcdee10d6f4d2db9c07c98c921f88e3c09754a7badad402be6b8d1d'
            'f03c74f969c100ca843345f9e5ce5de5cfbf8b7a0f05e208f3a17f7ce9b9548b'
            'c8a41c80f336ad0052844a54998c0b9bc6ce169ee17908fb0633fadcda7bc9e7')

build() {
  test ! -d ${srcdir}/${pkgname}-src && mkdir ${srcdir}/${pkgname}-src
  unzip -d "${srcdir}/${pkgname}-src/" "${srcdir}/${pkgname}-${pkgver}.zip"
  find ${srcdir} -type f \( -iname \*.exe -o -iname \*.bat \) -exec rm {} +
}
package() {
  mkdir -p "${pkgdir}/usr/share/${pkgname}/"
  cp -fR ${srcdir}/${pkgname}-src/Structorizer/* "${pkgdir}/usr/share/${pkgname}/"
  chmod u=rwX,go=rX "${pkgdir}/usr/share/${pkgname}"
  install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm655 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm655 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
