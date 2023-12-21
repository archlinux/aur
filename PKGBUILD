# Maintainer: Marco Steiger <marco (at) steiger (dot) online>
pkgname=structorizer
pkgver=3.32.15
pkgrel=1
relver="3.32-15"
pkgdesc="Structorizer is a little tool which you can use to create Nassi-Shneiderman Diagrams (NSD)"
url="https://structorizer.fisch.lu"
arch=('x86_64' 'i686')
license=('GPLv3')
makedepends=('unzip')
depends=('java-runtime')
install=${pkgname}.install
source=("${pkgname}-${relver}.zip::https://github.com/fesch/Structorizer.Desktop/releases/download/${relver}/structorizer_${relver}.zip"
        "${pkgname}.desktop"
        "${pkgname}.png::https://structorizer.fisch.lu/Pictures/structorizer.png"
        "${pkgname}")
sha256sums=('f06477432ad8e2da0fff83be9458788baa8513fa68e3456b63369df771331da2'
            '6d0bf4ba129605e13693f8a9ba06929c964a92574461e74a4fb3d0a81b8b27a4'
            'f03c74f969c100ca843345f9e5ce5de5cfbf8b7a0f05e208f3a17f7ce9b9548b'
            'c8a41c80f336ad0052844a54998c0b9bc6ce169ee17908fb0633fadcda7bc9e7')

build() {
  test ! -d ${srcdir}/${pkgname}-src && mkdir ${srcdir}/${pkgname}-src
  rm -rf "${srcdir}/${pkgname}-src/"
  unzip -d "${srcdir}/${pkgname}-src/" "${srcdir}/${pkgname}-${relver}.zip"
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
